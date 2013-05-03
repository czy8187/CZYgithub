//
//  PlayerDetailsViewController.m
//  Ratings
//
//  Created by 陈智洋 on 13-4-10.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import "PlayerDetailsViewController.h"
#import "Player.h"
#import "GamePickerViewController.h"

@interface PlayerDetailsViewController ()
{
    NSString *game;
}
@end

@implementation PlayerDetailsViewController
@synthesize delegate;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailLabel.text = game;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"init  PlayerDetialsViewController!");
        game = @"Chess";
    }
    return self;
}
- (void) dealloc
{
    NSLog(@"dealloc PlayerDetialsViewController !!");
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickGame"])
    {
        GamePickerViewController *gamePickerViewController = segue.destinationViewController;
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = game;
    }
}
#pragma mark - GamePickerViewControllerDelegate
- (void) gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)theGame
{
    game = theGame;
    self.detailLabel.text = game;
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Table view data source


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameTextFild becomeFirstResponder];
    }
}
- (IBAction)cancel:(id)sender
{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    Player *player = [[Player alloc] init];
    player.name = self.nameTextFild.text;
    player.game = game;
    player.rating = 3;
    [self.delegate playerDetailsViewController:self didAddPlayer:player];

}
@end
