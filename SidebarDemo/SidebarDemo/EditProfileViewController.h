//
//  EditProfileViewController.h
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/7/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UILabel *daysAvailableLabel;
@property (nonatomic, strong) NSString * daysAvailable;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
