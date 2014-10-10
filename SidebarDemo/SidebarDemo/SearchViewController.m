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
#import "SearchLocationTVC.h"
#import "SearchRateVC.h"
#import "QueryResultsTVC.h" 
#import <Parse/Parse.h>



@interface SearchViewController () <SearchGenreTVCDelegate, SearchAvailabilityTVCDelegate, SearchLocationTVCDelegate, SearchRateVCDelegate>

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
    UILabel * rateSearchs;
    UILabel * availabilitySearchs;
    
    PFGeoPoint * currentGeoPoint;
    
}


// NIGHTLY OR HOURLY

-(void)setNightlyOrHourly:(BOOL)nightlyOrHourly {
    _nightlyOrHourly = nightlyOrHourly;
    

    if (self.nightlyOrHourly==TRUE) {
        NSLog(@"Nightly");
    } else {
        NSLog(@"Hourly");

    }
}

// LOCATION SETTER

-(void)setSavedFormatAddress:(NSString *)savedFormatAddress {
    
    _savedFormatAddress = savedFormatAddress;
    
    NSLog(@"this %@",self.savedFormatAddress);
    
}

-(void)setLatitudeSetter:(double)latitudeSetter {
    
    _latitudeSetter = latitudeSetter;
    NSLog(@"Lat is %f",self.latitudeSetter);
}

-(void)setLongitudeSetter:(double)longitudeSetter {
    
    _longitudeSetter = longitudeSetter;
    NSLog(@"Long is %f",self.longitudeSetter);
    
}

-(void)setSavedRadius:(NSNumber *)savedRadius {
    
    _savedRadius = savedRadius;
}

// GENRES SETTER


- (void)setSearchArrayGenres:(NSMutableArray *)searchArrayGenres {
    _searchArrayGenres = searchArrayGenres;
}

- (void)setSavedSearchGenres:(NSString *)savedSearchGenres {
    
    _savedSearchGenres = savedSearchGenres;
        
    genreSearchs.text = savedSearchGenres;

}

// AVAILABILITY SETTER

-(void)setSearchArrayAvailability:(NSMutableArray *)searchArrayAvailability{
    _searchArrayAvailability = searchArrayAvailability;
    
}

- (void)setSavedSearchAvailability:(NSString *)savedSearchAvailability {
    
    _savedSearchAvailability = savedSearchAvailability;
    
    NSLog(savedSearchAvailability);
    
    availabilitySearchs.text = savedSearchAvailability;
    
}

// RATE SETTER

- (void)setSavedRateSetter:(NSNumber *)savedRateSetter {
    
    _savedRateSetter = savedRateSetter;
    
    if (self.nightlyOrHourly==TRUE) {
       
        NSLog(@"< %@/Nightly",self.savedRateSetter);

    } else {
        
        NSLog(@"< %@/Hourly",self.savedRateSetter);
        
    }
}


// VIEW DID LOAD

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchResults = [@[]mutableCopy];
    // Do any additional "setup after loading the view.
    
    SWRevealViewController *revealController = [self revealViewController];
    
    //[self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"]
        style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    
    searchSegmentControl = [[UISegmentedControl alloc]initWithItems:@[@"Musician / Band",@"Bar / Venue"]];
    [searchSegmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    searchSegmentControl.frame = CGRectMake(-10, 43, SCREEN_WIDTH + 30, 70);
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


    locationSearch = [[UIView alloc] initWithFrame:CGRectMake(-10, 113, SCREEN_WIDTH + 30, 100)];
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
    
    genreSearch = [[UIView alloc] initWithFrame:CGRectMake(-10, 213, SCREEN_WIDTH + 30, 100)];
    genreSearch.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    genreSearch.layer.borderWidth = 1;
    genreSearch.layer.borderColor = [[UIColor whiteColor]CGColor];
 
    // LABEL

    genreSearchs = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH + 20, 60)];
    [genreSearchs setTextAlignment: NSTextAlignmentCenter];
    genreSearchs.backgroundColor = [UIColor whiteColor];
    
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
    
    
    availabilitySearch = [[UIView alloc] initWithFrame:CGRectMake(-10, 313, SCREEN_WIDTH + 30, 100)];
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
    
    //// RATE
    
    rateSearch = [[UIView alloc] initWithFrame:CGRectMake(-10, 413, SCREEN_WIDTH + 30, 100)];
    rateSearch.backgroundColor = [UIColor colorWithRed:0.859f green:0.282f blue:0.255f alpha:1.0f];
    rateSearch.layer.borderWidth = 1;
    rateSearch.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    rateSearchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, rateSearch.bounds.size.width, rateSearch.bounds.size.height)];
    
    [rateSearchButton setTitle:@"Rate" forState:UIControlStateNormal];
    [rateSearchButton.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [rateSearchButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
    [rateSearchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rateSearch addSubview:rateSearchButton];
    
    rateSearchs = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH + 20, 40)];
    [rateSearchs setTextAlignment: NSTextAlignmentCenter];
    rateSearchs.backgroundColor = [UIColor whiteColor];
    
    [rateSearchButton addTarget:self action:@selector(rateSearchButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [rateSearch addSubview:rateSearchs];
    
    [self.view addSubview:rateSearch];
    
    // SEARCH BUTTON BOTTOM
    
    searchButton = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 40, SCREEN_WIDTH - 40, 50)];
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

-(void)searchLocationTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboardTwo" bundle: nil];
    
    SearchLocationTVC * searchLocation = [storyboard instantiateViewControllerWithIdentifier:@"searchLocationID"];
    
    searchLocation.delegate = self;
    
    [self.navigationController pushViewController:searchLocation animated:YES];

}

-(void)genreSearchButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"searchGenre" bundle: nil];
    
    SearchGenreTVC * searchGenre = [storyboard instantiateViewControllerWithIdentifier:@"searchGenreID"];
    
    searchGenre.delegate = self;
    
    [self.navigationController pushViewController:searchGenre animated:YES];
    
}

-(void)availabilitySearchButtonTapped {
    
    
    SearchAvailabilityTVC * searchAvailability = [[SearchAvailabilityTVC alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:searchAvailability];
    
    searchAvailability.delegate = self;
    
    [self.navigationController pushViewController:searchAvailability animated:YES];
    
}


-(void)rateSearchButtonTapped {
    SearchRateVC * searchRate = [[SearchRateVC alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:searchRate];
    
    searchRate.delegate = self;
    
    [self.navigationController pushViewController:searchRate animated:YES];
    
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

    if(self.searchArrayGenres.count > 0) {
        [query whereKey:@"genreArray" containedIn:self.searchArrayGenres];
    }
    
    if (self.searchArrayAvailability.count > 0) {
        
        [query whereKey:@"availabilityArray" containedIn:self.searchArrayAvailability];
    }
    
    // WE NEED THE RATE TO BE FILLED -- NEED IF ELSE STATEMENT
    
    if (self.savedRateSetter) {
    
    }
    
    if (self.nightlyOrHourly) {
        
        [query whereKey:@"nightlyRateNumber" lessThanOrEqualTo:self.savedRateSetter];
        [query orderByAscending:@"nightlyRateNumber"];

        NSLog(@"Querying Nightly Rate");
   
    } else {
        
        [query whereKey:@"hourlyRateNumber" lessThanOrEqualTo:self.savedRateSetter];
        [query orderByAscending:@"hourlyRateNumber"];
        
        NSLog(@"Querying Hourly Rate");
    }
    
    
//    currentGeoPoint = [PFGeoPoint geoPointWithLatitude:self.latitudeSetter longitude:self.longitudeSetter];
//    
//    NSLog(@"Search lat and long %@", currentGeoPoint);
//    
//    [query whereKey:@"location" nearGeoPoint:currentGeoPoint withinMiles:[self.savedRadius intValue]];

    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (searchSegmentControl.selectedSegmentIndex == 0) {
            
//            NSLog(@"%@",objects);
            
            for (PFUser * object in objects) {
                
                
                [self.searchResults addObject:object];
//                NSLog(@"object id is %@",object);
            }
            
        } else {
            
            for (PFUser * object in objects) {
                
                [self.searchResults addObject:object];
//                NSLog(@"object id is %@",object);
            }

        }
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"searchQueryResults" bundle: nil];
        
        QueryResultsTVC * queryResults = [storyboard instantiateViewControllerWithIdentifier:@"queryResultsId"];
        
        queryResults.searchResults = self.searchResults;
        
        [self.navigationController pushViewController:queryResults animated:YES];
        
//        NSLog(@"Before the passing %@",self.searchResults);
        
    }];
    
}



@end
