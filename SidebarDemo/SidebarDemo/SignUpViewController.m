//
//  SignUpViewController.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/21/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "SignUpViewController.h"
#import "ProfileViewController.h"

@interface SignUpViewController () <UITextFieldDelegate>

@end

@implementation SignUpViewController {
    UITextField * usernameTextField;
    UITextField * passwordTextField;
    UITextField * verifyPasswordTextField;
    UISegmentedControl * segmentControl;
    NSString * usernameText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    
    // Do any additional setup after loading the view.
    
    UIImageView *gLogo = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 140.0f)];
    [gLogo setImage:[UIImage imageNamed:@"bigG.png"]];
    gLogo.center = CGPointMake(self.view.center.x, 110);
    
    [self.view addSubview:gLogo];
    
    // USERNAME TEXT FIELD
    
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 360, SCREEN_WIDTH - 40, 50)];
    usernameTextField.backgroundColor = [UIColor whiteColor];
    usernameTextField.layer.cornerRadius = 5;
    usernameTextField.font = [UIFont systemFontOfSize:18];
    usernameTextField.placeholder = @"Username";
    usernameTextField.autocapitalizationType = FALSE;

    [usernameTextField setValue:[UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIView * paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    usernameTextField.leftView = paddingView;
    usernameTextField.leftViewMode = UITextFieldViewModeAlways;
    usernameTextField.delegate = self;

    [self.view addSubview:usernameTextField];
        
    // PASSWORD TEXT FIELD
    
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 290, SCREEN_WIDTH - 40, 50)];
    passwordTextField.backgroundColor = [UIColor whiteColor];
    passwordTextField.layer.cornerRadius = 5;
    passwordTextField.font = [UIFont systemFontOfSize:18];
    passwordTextField.placeholder = @"Password";
    passwordTextField.autocapitalizationType = FALSE;

    
    passwordTextField.secureTextEntry = YES;
    
    
    [passwordTextField setValue:[UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIView * paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    passwordTextField.leftView = paddingView2;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.delegate = self;

    [self.view addSubview:passwordTextField];
    
    // VERIFY PASSWORD TEXT FIELD
    
    verifyPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 220, SCREEN_WIDTH - 40, 50)];
    verifyPasswordTextField.backgroundColor = [UIColor whiteColor];
    verifyPasswordTextField.layer.cornerRadius = 5;
    verifyPasswordTextField.font = [UIFont systemFontOfSize:18];
    verifyPasswordTextField.placeholder = @"Verify Password";
    verifyPasswordTextField.autocapitalizationType = FALSE;
    [verifyPasswordTextField setValue:[UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    UIView * paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    verifyPasswordTextField.leftView = paddingView3;
    verifyPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    verifyPasswordTextField.secureTextEntry = YES;
    verifyPasswordTextField.delegate = self;

    [self.view addSubview:verifyPasswordTextField];
    
    // USERTYPE
    
    segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"Musician / Band",@"Bar / Venue"]];
    [segmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    segmentControl.frame = CGRectMake(20, SCREEN_HEIGHT - 150, SCREEN_WIDTH - 40, 50);
    
    UIColor *newTintColor = [UIColor whiteColor];
    segmentControl.tintColor = newTintColor;
    
    UIFont * font = [UIFont boldSystemFontOfSize:16.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [segmentControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
//    [segmentControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [segmentControl setSelectedSegmentIndex:0];
    [self.view addSubview:segmentControl];
//    [segmentControl release];
    
    
    
    // SIGN UP FINAL BUTTON
    
    UIButton * signUpFinalButton = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 80, SCREEN_WIDTH - 40, 50)];
    
    signUpFinalButton.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    signUpFinalButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [signUpFinalButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signUpFinalButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    signUpFinalButton.layer.cornerRadius = 5;
    signUpFinalButton.layer.borderWidth = 1;
    signUpFinalButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    [signUpFinalButton addTarget:self action:@selector(signUpFinalTouched) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:signUpFinalButton];

}


- (void)signUpFinalTouched {
    
    NSLog(@"%@",usernameTextField.text);
    
    NSLog(@"SignUpFinal Tappedity Tapped");
    
    PFUser *user = [PFUser user];
    user.username = usernameTextField.text;
    user.password = passwordTextField.text;
    
    if (segmentControl.selectedSegmentIndex == 0)
    {
        user[@"userType"] = @"musician";
    }
    else {
        
        user[@"userType"] = @"bar";
    }

   
    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
    
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboardTwo" bundle: nil];
    
    ProfileViewController * profileView = [storyboard instantiateViewControllerWithIdentifier:@"profileView"];
    
    [self presentViewController:profileView animated:YES completion:nil];
    
//    [self dismissViewControllerAnimated:YES completion:nil];


    
     //    user.email = @"email@example.com";
    
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
