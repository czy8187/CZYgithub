//
//  ViewController.h
//  RecordPwd
//
//  Created by 陈智洋 on 13-3-15.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    BOOL recordPwd;
    UITextField *nameTextField;
    UITextField *pswTextField;
    
}
@property (retain,nonatomic)UIImageView *recordBtn;
@property (retain,nonatomic)NSMutableArray *cellRightArray;

- (void)readUserInfoFromFile;
- (void)recoredBtnClick;
- (void)writePasswordToFile;
@end