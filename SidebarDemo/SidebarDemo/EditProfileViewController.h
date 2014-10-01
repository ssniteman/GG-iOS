//
//  EditProfileViewController.h
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/7/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height


@interface EditProfileViewController : UITableViewController

- (IBAction)editPhotoButton:(id)sender;
@property (nonatomic, strong) NSString * rate;
@property (weak, nonatomic) IBOutlet UILabel *daysAvailableLabel;
@property (nonatomic, strong) NSString * daysAvailable;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *zipTextBox;
@property (weak, nonatomic) IBOutlet UIButton *profileImageEdit;
@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;

- (IBAction)zipButton:(id)sender;

- (void)uploadImage:(NSData *)imageData;


@end
