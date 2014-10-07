//
//  EditRateVC.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/30/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "EditRateVC.h"
#import "EditProfileViewController.h"
#import <Parse/Parse.h>

@interface EditRateVC ()

@end

@implementation EditRateVC {
    
    UISegmentedControl * segmentControl;
    UITextField * rateTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    //RIGHT MENU BUTTON
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveButton)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    
    
    //LEFT MENU BUTTON
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButton)];
    
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    // SEGMENT CONTROL
    
    segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"Nightly",@"Hourly"]];
    [segmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    segmentControl.frame = CGRectMake(20, 100, SCREEN_WIDTH - 40, 50);
    
    UIColor *newTintColor = [UIColor redColor];
    segmentControl.tintColor = newTintColor;
    
    UIFont * font = [UIFont boldSystemFontOfSize:16.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [segmentControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    //    [segmentControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [segmentControl setSelectedSegmentIndex:0];
    [self.view addSubview:segmentControl];
    
    rateTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 360, SCREEN_WIDTH - 40, 50)];
    rateTextField.backgroundColor = [UIColor whiteColor];
    rateTextField.layer.cornerRadius = 5;
    rateTextField.font = [UIFont systemFontOfSize:18];
    rateTextField.placeholder = @"Rate";
    [rateTextField setValue:[UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIView * paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    rateTextField.leftView = paddingView;
    rateTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:rateTextField];

}

- (void) cancelButton{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)saveButton{
    
    PFUser * user = [PFUser currentUser];
    
    if (segmentControl.selectedSegmentIndex == 0) {
        
        user[@"nightlyRate"] = [NSString stringWithFormat:@"%@/nightly", rateTextField.text];
         [self.delegate setRate:[NSString stringWithFormat:@"%@/nightly", rateTextField.text]];
    
        // Saving Rate as number in Parse
        
        int rateIntNightly = [rateTextField.text intValue];

        
        user[@"nightlyRateNumber"] = @(rateIntNightly);

    } else {
    
        user[@"hourlyRate"] = [NSString stringWithFormat:@"%@/hourly", rateTextField.text];
        [self.delegate setRate:[NSString stringWithFormat:@"%@/hourly", rateTextField.text]];
        
        // Saving Rate as number in Parse
        
        int rateIntHourly = [rateTextField.text intValue];
        
        user[@"hourlyRateNumber"] = @(rateIntHourly);

    }
    
    [[PFUser currentUser] saveInBackground];
    
    [self cancelButton];
    
}

@end
