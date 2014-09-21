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
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];\
    
    // SIGN UP BUTTON
    
    UIButton * signUpButton = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 80, SCREEN_WIDTH - 40, 50)];
    
    signUpButton.backgroundColor = [UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f];
    [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signUpButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    signUpButton.layer.cornerRadius = 5;
    
    [self.view addSubview:signUpButton];
    
    // LOGIN BUTTON
    
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 150, SCREEN_WIDTH - 40, 50)];
    
    loginButton.backgroundColor = [UIColor clearColor];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setTitleColor: [UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f] forState:UIControlStateNormal];
    loginButton.layer.cornerRadius = 5;
    [loginButton.layer setBorderColor:[[UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f] CGColor]];
    [loginButton.layer setBorderWidth:1];
    
    [self.view addSubview:loginButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
