//
//  LoginViewController.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/26/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "LoginViewController.h"
#import "ProfileViewController.h"
#import <Parse/Parse.h>

#import "SWRevealViewController.h"
#import "MainViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@end

@implementation LoginViewController {
    
    UIButton * loginFinalButton;
    UITextField * loginUsernameTextField;
    UITextField * loginPasswordTextField;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
     self.view.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    
    UIImageView *gLogo = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 140.0f)];
    [gLogo setImage:[UIImage imageNamed:@"bigG.png"]];
    gLogo.center = CGPointMake(self.view.center.x, 110);
    
    [self.view addSubview:gLogo];
    
    
    
    // USERNAME TEXT FIELD
    
    loginUsernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 360, SCREEN_WIDTH - 40, 50)];
    loginUsernameTextField.backgroundColor = [UIColor whiteColor];
    loginUsernameTextField.layer.cornerRadius = 5;
    loginUsernameTextField.font = [UIFont systemFontOfSize:18];
    loginUsernameTextField.placeholder = @"Username";
    loginUsernameTextField.autocapitalizationType = FALSE;

    [loginUsernameTextField setValue:[UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIView * paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    loginUsernameTextField.leftView = paddingView;
    loginUsernameTextField.leftViewMode = UITextFieldViewModeAlways;
    loginUsernameTextField.delegate = self;
    
    [self.view addSubview:loginUsernameTextField];
    
    // PASSWORD TEXT FIELD
    
    loginPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 290, SCREEN_WIDTH - 40, 50)];
    loginPasswordTextField.backgroundColor = [UIColor whiteColor];
    loginPasswordTextField.layer.cornerRadius = 5;
    loginPasswordTextField.font = [UIFont systemFontOfSize:18];
    loginPasswordTextField.placeholder = @"Password";
    loginPasswordTextField.autocapitalizationType = FALSE;
    [loginPasswordTextField setValue:[UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    
    loginPasswordTextField.secureTextEntry = YES;
    loginPasswordTextField.delegate = self;
    
    UIView * paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    loginPasswordTextField.leftView = paddingView2;
    loginPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:loginPasswordTextField];
    
    
    // LOGIN BUTTON
    
    
    loginFinalButton = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 80, SCREEN_WIDTH - 40, 50)];
    
    loginFinalButton.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    loginFinalButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [loginFinalButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginFinalButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    loginFinalButton.layer.cornerRadius = 5;
    loginFinalButton.layer.borderWidth = 1;
    loginFinalButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    
    [loginFinalButton addTarget:self action:@selector(loginFinalTouched) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginFinalButton];
    

}

-(void)loginFinalTouched {
    
    
    [PFUser logInWithUsernameInBackground:loginUsernameTextField.text password:loginPasswordTextField.text block:^(PFUser *user, NSError *error) {
        
        if (user) {
            // Do stuff after successful login.
            
//            ProfileViewController * profileView = [[ProfileViewController alloc] init];
//            
//            profileView.whatProfileToLoad = TRUE;
//
//           [self presentViewController:profileView animated:YES completion:nil];

            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboardTwo" bundle: nil];
            
            SWRevealViewController * revealVC = [storyboard instantiateViewControllerWithIdentifier:@"revealVC"];

//            UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:profileView];
            
            
            ((UINavigationController *)self.presentingViewController).viewControllers = @[revealVC];
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
//            [((UINavigationController *)self.presentingViewController) pushViewController:revealVC animated:NO];
            
            
            
                 NSLog(@"Hey");
            
        } else {
        // The login failed. Check error to see why.
            
            
        }
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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
