//
//  ProfileViewController.h
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/7/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

//================================================================

//Top of Profile Page Content

//Top Profile Background
@property (weak, nonatomic) IBOutlet UIView *profileBackground;

//Band Name Label
@property (weak, nonatomic) IBOutlet UILabel *bandNameLabel;

//Profile Genre
@property (weak, nonatomic) IBOutlet UILabel *genreBandLable;

//Profile Picture
@property (weak, nonatomic) IBOutlet UIButton *profilePicture;

//City and State Label
@property (weak, nonatomic) IBOutlet UILabel *cityAndStateLabel;

//----------------------------------------------------------------


//Profile Social Accounts

//Button Actions

//Profile SoundCloud Button
- (IBAction)soundcloudButton:(id)sender;

//Profile Facebook Button
- (IBAction)facebookButton:(id)sender;

//Profile Instagram Button
- (IBAction)instagramButton:(id)sender;

//Button Properties

@property (weak, nonatomic) IBOutlet UIButton *photosButton;

@property (weak, nonatomic) IBOutlet UIButton *soundButton;

@property (weak, nonatomic) IBOutlet UIButton *videoButton;

@end
