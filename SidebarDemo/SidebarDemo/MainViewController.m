//
//  ViewController.m
//  SidebarDemo
//
//  Created by Simon on 28/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"



@interface MainViewController ()



@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Profile";

    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIButton * signUpButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 200, 300, 45)];
    
    signUpButton.backgroundColor = [UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f];
//    
//    signUpButton.backgroundColor = [UIColor clearColor];
//    
//    [signUpButton.layer setBorderColor:[[UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f] CGColor]];
//    [signUpButton.layer setBorderWidth:2];
    
    [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signUpButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
//    signUpButton.layer.cornerRadius = 20.0;
    
    [self.view addSubview:signUpButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
