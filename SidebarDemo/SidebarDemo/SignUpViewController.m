//
//  SignUpViewController.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/21/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f];
    // Do any additional setup after loading the view.
    
    
    UITextField * usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 290, SCREEN_WIDTH - 40, 50)];
    usernameTextField.backgroundColor = [UIColor whiteColor];
    usernameTextField.layer.cornerRadius = 5;
    usernameTextField.font = [UIFont systemFontOfSize:18];
    usernameTextField.placeholder = @"Username";
    [usernameTextField setValue:[UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIView * paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    usernameTextField.leftView = paddingView;
    usernameTextField.leftViewMode = UITextFieldViewModeAlways;

    [self.view addSubview:usernameTextField];
    
    
    UITextField * passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 220, SCREEN_WIDTH - 40, 50)];
    passwordTextField.backgroundColor = [UIColor whiteColor];
    passwordTextField.layer.cornerRadius = 5;
    passwordTextField.font = [UIFont systemFontOfSize:18];
    passwordTextField.placeholder = @"Password";
    [passwordTextField setValue:[UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIView * paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    passwordTextField.leftView = paddingView2;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;

    [self.view addSubview:passwordTextField];
    
    UITextField * verifyPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 150, SCREEN_WIDTH - 40, 50)];
    verifyPasswordTextField.backgroundColor = [UIColor whiteColor];
    verifyPasswordTextField.layer.cornerRadius = 5;
    verifyPasswordTextField.font = [UIFont systemFontOfSize:18];
    verifyPasswordTextField.placeholder = @"Verify Password";
    [verifyPasswordTextField setValue:[UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIView * paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    verifyPasswordTextField.leftView = paddingView3;
    verifyPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:verifyPasswordTextField];
    
    
    UIButton * signUpFinalButton = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 80, SCREEN_WIDTH - 40, 50)];
    
    signUpFinalButton.backgroundColor = [UIColor colorWithRed:0.694f green:0.165f blue:0.161f alpha:1.0f];
    signUpFinalButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [signUpFinalButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signUpFinalButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    signUpFinalButton.layer.cornerRadius = 5;
    signUpFinalButton.layer.borderWidth = 1;
    signUpFinalButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    [self.view addSubview:signUpFinalButton];
    
    
    
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

@end
