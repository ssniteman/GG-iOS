//
//  EditProfileViewController.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/7/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "EditProfileViewController.h"
#import "ProfileViewController.h"
#import "SWRevealViewController.h"
#import "AvailabilityTVC.h"
#import "EditGenreTVC.h"
#import <Parse/Parse.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Accelerate/Accelerate.h>
#import "EditRateVC.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface EditProfileViewController ()<UITableViewDataSource,UITableViewDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AvailableTVCDelegate,RateDelegate>

@property (weak, nonatomic) IBOutlet UITableViewCell *availabilityCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *editGenreCell;
@property (weak, nonatomic) IBOutlet UITextField *nameCell;
@property (weak, nonatomic) IBOutlet UIView *rateCell;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;


@end

@implementation EditProfileViewController {
   
    UIImagePickerController * picker;
    UIImage *image;
    
    NSDictionary * location;
    
    double latitude;
    double longitude;
    
    NSDictionary * address;
}

// RATE SETTER

-(void)setRate:(NSString *)rate{
    _rate = rate;
    
    self.rateLabel.text = self.rate;
}


// AVAILABILITY SETTER

-(void)setDaysAvailable:(NSString *)daysAvailable {
    _daysAvailable = daysAvailable;
  
    self.daysAvailableLabel.text = daysAvailable;
    
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(editSaveButton)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    
    
    PFUser * user = [PFUser currentUser];
   
    self.nameCell.text = user[@"bandName"];
    self.emailTextField.text = user[@"email"];
    self.zipTextBox.text = address[@"formatted_address"];

    
    PFFile *imageFile = user[@"image"];
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        
        NSLog(@"data loaded");
        
        UIImage * image = [UIImage imageWithData:data];
        self.editImageView.image = image;
        
        
    }];

    
    self.tableView.delegate = self;
    
    self.tableView.dataSource =self;
    
    [self.changeZipButton setHidden:YES];

    
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
        
        openAvailability.delegate = self;

        [self.navigationController pushViewController:openAvailability animated:YES];
        
    } else if (theCellClicked == self.editGenreCell) {
    
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"genre" bundle: nil];
        
        EditGenreTVC * editGenre = [storyboard instantiateViewControllerWithIdentifier:@"editGenreID"];
        
        [self.navigationController pushViewController:editGenre animated:YES];

    } else if (theCellClicked == self.rateCell) {
        
        EditRateVC * editRate = [[EditRateVC alloc] init];
        
        editRate.delegate = self;
        
        [self.navigationController pushViewController:editRate animated:YES];
        
    }
    
}


- (IBAction)changeZipButton:(id)sender {
    
    self.zipTextBox.text = @"";
    self.changeZipButton.hidden = YES;
    self.zipButton.hidden = NO;


}

- (IBAction)zipButton:(id)sender {
    if ([self.zipTextBox.text length]>0) {
        NSString * urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=true",self.zipTextBox.text];
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSURLResponse * response = nil;
        
        NSError * error = nil;
        NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSDictionary *resultsInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
        
        address =resultsInfo[@"results"][0];
        
        
        location = resultsInfo[@"results"][0][@"geometry"][@"location"];
        
        NSLog(@"lat %@, long %@",location[@"lat"],location[@"lng"]);
        
        latitude =[location[@"lat"]doubleValue];
        
        longitude = [location[@"lng"]doubleValue];
        
        self.zipTextBox.text = address[@"formatted_address"];
        
        self.zipButton.hidden = YES;
        self.changeZipButton.hidden = NO;
    }
    
    
}

-(void)editSaveButton {
    
    PFUser * user = [PFUser currentUser];
    
    user[@"bandName"] = self.nameCell.text;
    user[@"email"] = self.emailTextField.text;
    
    PFGeoPoint * point = [PFGeoPoint geoPointWithLatitude:latitude longitude:longitude];

    user[@"location"] = point;
    
    [[PFUser currentUser] saveInBackground];
    
    [self.navigationController popViewControllerAnimated:YES];

//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboardTwo" bundle: nil];
//    ProfileViewController * profileView = [storyboard instantiateViewControllerWithIdentifier:@"profileView"];
//    [self.navigationController pushViewController:profileView animated:YES];
//    
    
}

- (IBAction)editPhotoButton:(id)sender {
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select Photo option:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Take Photo",
                            @"Choose Existing",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
    
    
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    
                    if ([UIImagePickerController isSourceTypeAvailable:
                         UIImagePickerControllerSourceTypeCamera])
                    {
                        UIImagePickerController *imagePicker =
                        [[UIImagePickerController alloc] init];
                        imagePicker.delegate = self;
                        imagePicker.sourceType =
                        UIImagePickerControllerSourceTypeCamera;
                        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
                        imagePicker.allowsEditing = NO;
                        [self presentViewController:imagePicker animated:YES completion:nil];
                        _newMedia = YES;
                    }
                    break;
                case 1:
                    [self pickImage];
                    
                    break;
                    
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        image = info[UIImagePickerControllerOriginalImage];
        
        self.editImageView.image = image;
        
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
        
        
        NSData *imageData = UIImagePNGRepresentation(image);
        PFFile *imageFile = [PFFile fileWithData:imageData];
        
        PFUser * user = [PFUser currentUser];
        user[@"image"] = imageFile;
        [user saveInBackground];
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
    
    
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo {
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void) pickImage {
    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    //    if((UIButton *) sender == choosePhotoBtn) {
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //    } else {
    //        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    //    }
    
    [self presentModalViewController:picker animated:YES];
}


@end
