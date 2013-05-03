//
//  ViewController.m
//  UserDefaultTest
//
//  Created by 陈智洋 on 13-4-2.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize swith = _swith;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize age = _age;
@synthesize imageView = _imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    //取出数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    BOOL isON  = [defaults boolForKey:@"SWITCH_TAG"];
    [_swith setOn:isON animated:YES];
    
    NSString *firstNameStr = [defaults objectForKey:@"firstName"];
    NSString *lastNameStr = [defaults objectForKey:@"lastName"];
    
    int ageInt = [defaults integerForKey:@"age"];
    NSString *ageStr = [NSString stringWithFormat:@"%i",ageInt];
    
    NSData *imageData = [defaults objectForKey:@"image"];
    UIImage *image = [UIImage imageWithData:imageData];
    
    //更新数据
    _firstName.text = firstNameStr;
    _lastName.text = lastNameStr;
    _age.text = ageStr;
    _imageView.image = image;
    self.view.userInteractionEnabled = YES;
    [self.view endEditing:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchAction:(id)sender
{
    UISwitch *switchTemp = (UISwitch *)sender;
    _swith.on = switchTemp.on;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSNumber *num = [NSNumber numberWithBool:switchTemp.isOn];
    if (switchTemp.isOn)
    {
        NSLog(@"ON");
        
        
    
    }
    else
    {
        NSLog(@"OFF");
        
        
        
    }
    [defaults setBool:switchTemp.isOn forKey:@"SWITCH_TAG"];
}

- (IBAction)chooseImageAction:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:picker animated:YES];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    _imageView.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}
- (IBAction)saveAction:(id)sender
{
    //隐藏键盘
    [_firstName resignFirstResponder];
    [_lastName resignFirstResponder];
    [_age resignFirstResponder];
    
    //赋值操作
    NSString *fNameStr = [_firstName text];
    NSString *lNameStr = [_lastName text];
    int ageInt = [[_age text] integerValue];
    
    UIImage *image = _imageView.image;
    NSData *imageData = UIImageJPEGRepresentation(image, 100);
    
    //userDefault
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //保存数据
    [defaults setObject:fNameStr forKey:@"firstName"];
    [defaults setObject:lNameStr forKey:@"lastName"];
    [defaults setInteger:ageInt forKey:@"age"];
    [defaults setObject:imageData forKey:@"image"];
    
    [defaults synchronize];//数据持久化
    
    NSLog(@"Data Saved");
    
}

- (IBAction)hidekeybordAction:(id)sender
{
    NSLog(@"隐藏键盘");
    for (UITextField *tf in [self.view subviews])
    {
        if ([tf isKindOfClass:[UITextField class]])
        {
            [tf resignFirstResponder];
        }
    }
}

@end
