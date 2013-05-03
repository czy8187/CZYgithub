//
//  ViewController.m
//  CustomCell
//
//  Created by 陈智洋 on 12-12-31.
//  Copyright (c) 2012年 卡派. All rights reserved.
//

#import "ViewController.h"
#import "InfoCell.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize tab;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tab = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tab setDelegate:self];
    [tab setDataSource:self];
    [self.view addSubview:tab];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSString *cellName = @"InfoCell";
        InfoCell *cell = (InfoCell *)[tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
        
        if (cell == nil){
            cell = [[[InfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName]autorelease];
        }else{
            cell = [[[InfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName]autorelease];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
//    if (indexPath.section == 1) {
//        NSString *cellFood = @"FoodCell";
//        
//    }
    return nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    [tab release];
    [super dealloc];
}
@end
