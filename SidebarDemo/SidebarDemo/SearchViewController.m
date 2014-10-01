//
//  SearchViewController.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/7/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "SearchViewController.h"
#import "SWRevealViewController.h"
#import "SearchGenreTVC.h"
#import "SearchAvailabilityTVC.h"
#import <Parse/Parse.h>

@interface SearchViewController () <SearchGenreTVCDelegate, SearchAvailabilityTVCDelegate>

@end

@implementation SearchViewController {
   
    UISegmentedControl * searchSegmentControl;
    UIView * locationSearch;
    UIButton * searchLocationButton;
    UIView * genreSearch;
    UIButton * genreSearchButton;
    UIView * availabilitySearch;
    UIButton * searchButton;
    UIButton * availabilitySearchButton;
    UIView * rateSearch;
    UIButton * rateSearchButton;
    UILabel * genreSearchs;
    UILabel * availabilitySearchs;


}

- (void)setSavedSearchGenres:(NSString *)savedSearchGenres {
    
    _savedSearchGenres = savedSearchGenres;
    
    NSLog(savedSearchGenres);
    
    genreSearchs.text = savedSearchGenres;

}


- (void)setSavedSearchAvailability:(NSString *)savedSearchAvailability {
    
    _savedSearchAvailability = savedSearchAvailability;
    
    NSLog(savedSearchAvailability);
    
    availabilitySearchs.text = savedSearchAvailability;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional "setup after loading the view.
    
    SWRevealViewController *revealController = [self revealViewController];
    
    //[self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"]
        style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    
    searchSegmentControl = [[UISegmentedControl alloc]initWithItems:@[@"Musician / Band",@"Bar / Venue"]];
    [searchSegmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    searchSegmentControl.frame = CGRectMake(-10, 80, SCREEN_WIDTH + 30, 70);
    searchSegmentControl.layer.borderWidth = 0;
    UIColor *newTintColor = [UIColor whiteColor];
    searchSegmentControl.tintColor = newTintColor;
    UIFont * font = [UIFont boldSystemFontOfSize:16.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [searchSegmentControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    //    [segmentControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [searchSegmentControl setSelectedSegmentIndex:0];
    [self.view addSubview:searchSegmentControl];
    //    [segmentControl release];


    locationSearch = [[UIView alloc] initWithFrame:CGRectMake(-10, 150, SCREEN_WIDTH + 30, 100)];
    locationSearch.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    locationSearch.layer.borderWidth = 1;
    locationSearch.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    searchLocationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, locationSearch.bounds.size.width, locationSearch.bounds.size.height)];

    [searchLocationButton setTitle:@"Location" forState:UIControlStateNormal];
    [searchLocationButton.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [searchLocationButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
    [searchLocationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [locationSearch addSubview:searchLocationButton];
    
    [searchLocationButton addTarget:self action:@selector(searchLocationTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:locationSearch];
    
    

    
    // GENRE VIEW
    
    genreSearch = [[UIView alloc] initWithFrame:CGRectMake(-10, 250, SCREEN_WIDTH + 30, 100)];
    genreSearch.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    genreSearch.layer.borderWidth = 1;
    genreSearch.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    // LABEL
    
    
    genreSearchs = [[UILabel alloc] initWithFrame:CGRectMake(60, 60, 200, 60)];
    genreSearchs.backgroundColor = [UIColor greenColor];
    genreSearchs.textColor = [UIColor blackColor];
    
    
    // BUTTON
    
    genreSearchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, genreSearch.bounds.size.width, genreSearch.bounds.size.height)];
    [genreSearchButton setTitle:@"Genre" forState:UIControlStateNormal];
    [genreSearchButton.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [genreSearchButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
    [genreSearchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [genreSearch addSubview:genreSearchButton];
    
    [genreSearchButton addTarget:self action:@selector(genreSearchButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [genreSearch addSubview:genreSearchs];
    
    [self.view addSubview:genreSearch];
    
    
    availabilitySearch = [[UIView alloc] initWithFrame:CGRectMake(-10, 350, SCREEN_WIDTH + 30, 100)];
    availabilitySearch.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    availabilitySearch.layer.borderWidth = 1;
    availabilitySearch.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    
    // LABEL
    
    
    availabilitySearchs = [[UILabel alloc] initWithFrame:CGRectMake(60, 60, 200, 60)];
    availabilitySearchs.backgroundColor = [UIColor greenColor];
    availabilitySearchs.textColor = [UIColor blackColor];
    
    availabilitySearchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, availabilitySearch.bounds.size.width, availabilitySearch.bounds.size.height)];
    
    [availabilitySearchButton setTitle:@"Availability" forState:UIControlStateNormal];
    [availabilitySearchButton.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [availabilitySearchButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
    [availabilitySearchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [availabilitySearch addSubview:availabilitySearchButton];
    
    [availabilitySearchButton addTarget:self action:@selector(availabilitySearchButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [availabilitySearch addSubview:availabilitySearchs];

    
    [self.view addSubview:availabilitySearch];
    
    ////
    
    rateSearch = [[UIView alloc] initWithFrame:CGRectMake(-10, 450, SCREEN_WIDTH + 30, 100)];
    rateSearch.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    rateSearch.layer.borderWidth = 1;
    rateSearch.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    rateSearchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, rateSearch.bounds.size.width, rateSearch.bounds.size.height)];
    
    [rateSearchButton setTitle:@"Rate" forState:UIControlStateNormal];
    [rateSearchButton.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [rateSearchButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
    [rateSearchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rateSearch addSubview:rateSearchButton];
    
    [rateSearchButton addTarget:self action:@selector(rateSearchButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:rateSearch];
    

    
    // SEARCH BUTTON BOTTOM
    
    
    searchButton = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 100, SCREEN_WIDTH - 40, 50)];
    searchButton.backgroundColor = [UIColor whiteColor];
    searchButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [searchButton setTitleColor: [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f] forState:UIControlStateNormal];
    searchButton.layer.cornerRadius = 5;
    searchButton.layer.borderWidth = 1;
    searchButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    [searchButton addTarget:self action:@selector(searchButtonTickled) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:searchButton];
    
}


-(void)genreSearchButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"searchGenre" bundle: nil];
    
    SearchGenreTVC * searchGenre = [storyboard instantiateViewControllerWithIdentifier:@"searchGenreID"];
    
    searchGenre.delegate = self;
    
    [self.navigationController pushViewController:searchGenre animated:YES];
    NSLog(@"Hey");
    
}

-(void)availabilitySearchButtonTapped {
    
    
    SearchAvailabilityTVC * searchAvailability = [[SearchAvailabilityTVC alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:searchAvailability];
    
    searchAvailability.delegate = self;
    
    [self.navigationController pushViewController:searchAvailability animated:YES];
    
}


-(void)searchLocationTapped {
    
    
}


-(void)searchButtonTickled {
    
    PFUser * user = [PFUser user];
    
    if (searchSegmentControl.selectedSegmentIndex==0)
    {
        user[@"userType"] = @"musician";
    }
    else {
        
        user[@"userType"] = @"bar";
    }
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"userType" equalTo:@"musician"]; // find all the musicians
    
    NSArray * musicians = [query findObjects];
    
    NSLog(@"%@",musicians[0]);
    
    
    for (NSDictionary * users in musicians) {
        NSLog(@"%@",users[@"username"]);
    }

    
    
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
