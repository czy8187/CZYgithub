//
//  GamePickerViewController.h
//  Ratings
//
//  Created by 陈智洋 on 13-4-10.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GamePickerViewController;
@protocol GamPickerViewControllerDelegate <NSObject>

- (void) gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)theGame;

@end


@interface GamePickerViewController : UITableViewController
//{
//    NSArray *games;
//}

@property (nonatomic, weak) id <GamPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *game;

@end
