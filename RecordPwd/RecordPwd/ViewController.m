//
//  ViewController.m
//  RecordPwd
//
//  Created by 陈智洋 on 13-3-15.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

//
//  ViewController.m
//  plistTest
//
//  Created by changjian on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define USERNAME @"nameTextField"
#define PASSWORD @"pswTextField"

@implementation ViewController
@synthesize recordBtn;
@synthesize cellRightArray;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    cellRightArray = [[NSMutableArray alloc]init];//作为属性变量的数组如果不初始化是不能用的，这个数组用来保存UITextFiled中的用户名和密码。
    recordPwd = NO;//刚开始把是否保存密码设置为NO
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(10, 20, 300, 100) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundView = nil;
    table.backgroundColor = [UIColor clearColor];
    table.showsVerticalScrollIndicator = NO;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    recordBtn = [[UIImageView alloc]init];//这个就是那个带钩的小框框，之前尝试用UIButton，但是不好切换button的backgroundView，所以就换了UIImageView,给它添加手势。
    recordBtn.frame = CGRectMake(180, 130, 40, 40);
    recordBtn.userInteractionEnabled = YES;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110, 130, 100, 40)];
    label.text = @"记住密码";
    [self.view addSubview:label];
    [label release];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(recoredBtnClick)];//添加了一个手势，单击触发事件
    tapGesture.numberOfTapsRequired = 1;//点击一下
    [recordBtn addGestureRecognizer:tapGesture];//这里注意是在UIImageView上添加手势
    [self readUserInfoFromFile];//在图片初始化之前先读取plist文件，判断recordPwd
    
    if (recordPwd) {
        recordBtn.image = [UIImage imageNamed:@"check_on.png"];
    }
    else{
        recordBtn.image = [UIImage imageNamed:@"check_off.png"];
    }
    [self.view addSubview:table];
    [self.view addSubview:recordBtn];
    [tapGesture release];
    [table release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.recordBtn = nil;
    self.cellRightArray = nil;
}

- (void)readUserInfoFromFile//从plist读取数据
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    //以上的三句话获取沙盒中data.plist的路径。
    NSLog(@"文件路径：%@",path);
    NSMutableDictionary *saveStock = [[NSMutableDictionary alloc]initWithContentsOfFile:path];//从该路径读取文件，注意这里是读取，跟创建plist的init方法不同，看下面就知道了
    recordPwd = [[saveStock objectForKey:@"recordPwd"]boolValue];//@"recordPwd"是一个key，存到字典何从字典中取值都要用到
    if (!recordPwd)
    {
        nameTextField.text = @"";
        pswTextField.text = @"";
        [saveStock removeAllObjects];//移除字典内所有元素
    }
    else{
        nameTextField.text = [saveStock objectForKey:USERNAME];
        pswTextField.text = [saveStock objectForKey:PASSWORD];
        [pswTextField setSecureTextEntry:YES];//密码设置为暗文
    }
    NSLog(@"nameTextField.text==%@,pswTextField.text=%@",nameTextField.text,pswTextField.text);
    NSLog(@"读取saveStock=%@",saveStock);
    [saveStock release];
}

//把是否记住密码信息写进data.plist文件
- (void)writePasswordToFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"filePath:%@",path);
    NSMutableDictionary *data = [[NSMutableDictionary alloc]init];//字典初始化，注意这里的init方法，跟-(void)readUserInfoFromFile方法中的字典初始化方法不同。
    NSLog(@"self.cellRightArray=%@",self.cellRightArray);
    if (nameTextField.text.length != 0||pswTextField.text.length != 0) {//如果输入不为空
        [data setObject:nameTextField.text forKey:USERNAME];//用户名和密码存入字典，这里的key用了宏定义，其实@"recordPwd"也可以用，在文中多次使用比较省事
        [data setObject:pswTextField.text forKey:PASSWORD];
    }
    [data setObject:[NSNumber numberWithBool:recordPwd] forKey:@"recordPwd"];
    [data writeToFile:path atomically:YES];
    NSLog(@"是否记住密码信息==%@",data);
    [data release];
}

- (void)recoredBtnClick//点击是否记住密码
{
    UIImage *image = [[UIImage alloc]init];
    if (recordPwd) {
        recordBtn.image = [UIImage imageNamed:@"check_off.png"];
        recordPwd = NO;
    }
    else{
        recordBtn.image = [UIImage imageNamed:@"check_on.png"];
        recordPwd = YES;
    }
    [self writePasswordToFile];
    [image release];
}

#pragma mark -tableView代理方法实现-

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *left = [NSArray arrayWithObjects:@"姓名:",@"密码:", nil];
    NSArray *right = [NSArray arrayWithObjects:@"请输入用户名",@"请输入密码", nil];
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier]autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 8, 80, 30)];
        label.text = [NSString stringWithFormat:[left objectAtIndex:indexPath.row],nil];
        label.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label];
        [label release];
        if (indexPath.row == 0 ){
            nameTextField = [[[UITextField alloc]initWithFrame:CGRectMake(90, 10, 140, 30)]autorelease];
            nameTextField.placeholder = [NSString stringWithFormat:[right objectAtIndex:indexPath.row],nil];
            nameTextField.delegate = self;
            [cell.contentView addSubview:nameTextField];
        }else{
            pswTextField = [[[UITextField alloc]initWithFrame:CGRectMake(90, 10, 140, 30)]autorelease];
            pswTextField.placeholder = [NSString stringWithFormat:[right objectAtIndex:indexPath.row],nil];
            pswTextField.delegate = self;
            [pswTextField setSecureTextEntry:YES];
            [cell.contentView addSubview:pswTextField];//本人智商不够，所以才去这种笨写法，不知道有没高手能用循环创建来写？
            [self readUserInfoFromFile];//还要再读取一次，如果注销会发生什么？大家可以去试试
        }
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event//点击空白处隐藏键盘
{
    [nameTextField resignFirstResponder];
    [pswTextField resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [cellRightArray release];
    [nameTextField release];
    [pswTextField release];
    [recordBtn release];
    [super dealloc];
}

@end
