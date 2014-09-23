//
//  ProfileViewController.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/7/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "ProfileViewController.h"
#import "SWRevealViewController.h"


// WIDTH & HEIGHT

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealController = [self revealViewController];
    
    //[self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"]
        style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    //Setting the Profile Background color
    
    self.profileBackground.backgroundColor = [UIColor colorWithRed:0.753f green:0.251f blue:0.208f alpha:1.0f];

    //Setting the profile picture to be round
    self.profilePicture.layer.cornerRadius = 50;
    self.profilePicture.clipsToBounds = YES;
    
    //Position for the Photos Button
    self.photosButton.frame = CGRectMake(10, SCREEN_HEIGHT-105, 95, 95);
    self.photosButton.backgroundColor = [UIColor colorWithRed:0.753f green:0.251f blue:0.208f alpha:1.0f];
    
    //Position for the Sound Button
    self.soundButton.frame = CGRectMake(SCREEN_WIDTH/2.0-47.5, SCREEN_HEIGHT-105, 95, 95);
    self.soundButton.backgroundColor = [UIColor colorWithRed:0.753f green:0.251f blue:0.208f alpha:1.0f];

    //Position for the video Button
    self.videoButton.frame = CGRectMake(SCREEN_WIDTH-105, SCREEN_HEIGHT-105, 95, 95);
    self.videoButton.backgroundColor = [UIColor colorWithRed:0.753f green:0.251f blue:0.208f alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)soundcloudButton:(id)sender {
}

- (IBAction)facebookButton:(id)sender {
}

- (IBAction)instagramButton:(id)sender {
}
@end
