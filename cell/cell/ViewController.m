//
//  ViewController.m
//  cell
//
//  Created by 陈智洋 on 13-1-1.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize tab;
@synthesize infoView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    tab = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tab.delegate = self;
    tab.dataSource = self;
    tab.backgroundColor = [UIColor clearColor];
    infoView = [[InfoView alloc] init];
//	[self.view addSubview:tab];
    //UILabel自适应高度和自动换行
    //初始化label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
    //设置自动行数与字符换行
    [label setNumberOfLines:0];
//    label.lineBreakMode = UILineBreakModeWordWrap;
    // 测试字串
    NSString *s = @"这是一个测试！！！adsfsaf时发生发勿忘我勿忘我勿忘我勿忘我勿忘我阿阿阿阿阿阿阿阿阿阿阿阿阿啊00000000阿什顿。。。";
    UIFont *font = [UIFont fontWithName:@"RTWSYueGoTrial-Light" size:20];
    //设置一个行高上限
    CGSize size = CGSizeMake(320,2000);
    //计算实际frame大小，并将label的frame变成实际大小
    CGSize labelsize = [s sizeWithFont:font constrainedToSize:size];
    label.text = s;
    label.font = font;
    label.frame = CGRectMake(0, 0, labelsize.width, labelsize.height);
    [self.view addSubview:label];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor redColor];
        cell.backgroundView = infoView;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) dealloc
{
    [infoView release];
    [tab release];
    [super dealloc];
}
@end
