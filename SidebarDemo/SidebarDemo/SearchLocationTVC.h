//
//  SearchLocationTVC.h
//  SidebarDemo
//
//  Created by Shane Sniteman on 10/2/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchLocationTVC : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (weak, nonatomic) IBOutlet UITextField *searchZip;

- (IBAction)changeZip:(id)sender;

- (IBAction)currentLocationSwitch:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *currentLocationSwitchOutlet;


@end
