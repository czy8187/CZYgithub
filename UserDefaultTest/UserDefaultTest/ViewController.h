//
//  ViewController.h
//  UserDefaultTest
//
//  Created by 陈智洋 on 13-4-2.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UISwitch *swith;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *age;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)switchAction:(id)sender;
- (IBAction)chooseImageAction:(id)sender;
- (IBAction)saveAction:(id)sender;
- (IBAction)hidekeybordAction:(id)sender;
@end
