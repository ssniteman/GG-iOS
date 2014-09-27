//
//  EditProfileViewController.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/7/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "EditProfileViewController.h"
#import "SWRevealViewController.h"
#import "AvailabilityTVC.h"

@interface EditProfileViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableViewCell *availabilityCell;

@end

@implementation EditProfileViewController{

}

-(void)setDaysAvailable:(NSString *)daysAvailable{
    _daysAvailable = daysAvailable;
    
    
    //self.daysAvailableLabel.text = self.daysAvailable;
    
    NSLog(@"%@",self.daysAvailable);
    
    [self.tableView reloadData];
    
    self.navigationController.title = self.daysAvailable;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource =self;
    
    
    SWRevealViewController *revealController = [self revealViewController];
    
    //[self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"]
        style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
   self.daysAvailableLabel.text = self.daysAvailable;
}





- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    UITableViewCell *theCellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
    if (theCellClicked == self.availabilityCell) {
    
        AvailabilityTVC * openAvailability = [[AvailabilityTVC alloc] init];
    
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:openAvailability];

        
        [self presentViewController:navController animated:YES completion:nil];


    }


}


@end
