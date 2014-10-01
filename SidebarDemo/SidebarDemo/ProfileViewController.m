//

//  ProfileViewController.m

//  SidebarDemo


//


#import "ProfileViewController.h"
#import "SWRevealViewController.h"
#import <Parse/Parse.h>

// WIDTH & HEIGHT



#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ProfileViewController ()


@end

@implementation ProfileViewController{
    UIButton * theProfilePicture;
    
}

- (void)viewDidLoad {
    
    PFUser * user = [PFUser currentUser];
 
    [super viewDidLoad];
    //LEFT MENU BUTTON
    SWRevealViewController *revealController = [self revealViewController];
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    //RIGHT MENU BUTTON
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    
    //Position for the Photos Button
    
    self.photosButton.frame = CGRectMake(10, SCREEN_HEIGHT-105, 95, 95);
    
    self.photosButton.backgroundColor = [UIColor colorWithRed:0.753f green:0.251f blue:0.208f alpha:1.0f];
    
    
    
    //Position for the Sound Button
    
    self.soundButton.frame = CGRectMake(SCREEN_WIDTH/2.0-47.5, SCREEN_HEIGHT-105, 95, 95);
    
    self.soundButton.backgroundColor = [UIColor colorWithRed:0.753f green:0.251f blue:0.208f alpha:1.0f];
    
    
    
 //Position for the video Button
    
    self.videoButton.frame = CGRectMake(SCREEN_WIDTH-105, SCREEN_HEIGHT-105, 95, 95);
    
    self.videoButton.backgroundColor = [UIColor colorWithRed:0.753f green:0.251f blue:0.208f alpha:1.0f];
    
    
    
 // TOP VIEW BACKGROUND
    
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -150)];
    
    topView.backgroundColor = [UIColor colorWithRed:0.753f green:0.251f blue:0.208f alpha:1.0f];
    
    [self.view addSubview:topView];
    
 //Setting the profile picture to be round
    
    theProfilePicture = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-70, 90, 140, 140)];
    UIImage *profileImage = [UIImage imageNamed:@"avatarcopy.jpg"];
    [theProfilePicture setBackgroundImage:profileImage forState:UIControlStateNormal];
    theProfilePicture.layer.cornerRadius = 70;
    theProfilePicture.userInteractionEnabled = false;
    theProfilePicture.clipsToBounds = YES;

//BAND NAME LABEL
    
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, topView.bounds.size.height-100, 200, 21)];
    [nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"Your Band Name ";
    nameLabel.text = user[@"bandName"];
    
// Genre LABEL
    
    UILabel * genreLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, topView.bounds.size.height-75, 200, 21)];
    [genreLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20]];
    
    genreLabel.textColor = [UIColor whiteColor];
    genreLabel.textAlignment = NSTextAlignmentCenter;
    genreLabel.text = user[@"genre"];
    
 //City & State LABEL
    
    UILabel * stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, topView.bounds.size.height-50, 200, 21)];
    [stateLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20]];
    
    stateLabel.textColor = [UIColor whiteColor];
    stateLabel.textAlignment = NSTextAlignmentCenter;
    stateLabel.text = @"City, State";
    
    [topView addSubview:nameLabel];
    [topView addSubview:genreLabel];
    [topView addSubview:stateLabel];
    
    [topView addSubview:theProfilePicture];
}


- (IBAction)soundcloudButton:(id)sender {
    
}



- (IBAction)facebookButton:(id)sender {
    
}



- (IBAction)instagramButton:(id)sender {
    
}

@end