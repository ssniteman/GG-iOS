//
//  SearchLocationTVC.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 10/2/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "SearchLocationTVC.h"
#import "SearchViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>

#import <CoreLocation/CoreLocation.h>



@interface SearchLocationTVC ()<UITableViewDataSource,UITableViewDelegate, UIImagePickerControllerDelegate>

@end

@implementation SearchLocationTVC {
    
    // Location
    
    NSDictionary * location;
    
    double latitude;
    double longitude;
    
    GMSMapView *mapView_;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource =self;

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 2;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (IBAction)changeZip:(id)sender {
    
    NSString * urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=true",self.searchZip.text];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse * response = nil;
    
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary *resultsInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSDictionary * address =resultsInfo[@"results"][0];
    
    
    location = resultsInfo[@"results"][0][@"geometry"][@"location"];
    
    NSLog(@"lat %@, long %@",location[@"lat"],location[@"lng"]);
    
    latitude =[location[@"lat"]doubleValue];
    
    longitude = [location[@"lng"]doubleValue];
    
    self.searchZip.text =address[@"formatted_address"];
   
}

- (IBAction)currentLocationSwitch:(id)sender {
    
    
    if (self.currentLocationSwitchOutlet.on) {
        
        NSLog(@"Hey");
        
        
        [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
            
            NSLog(@"Hello");
            
            NSLog(@"%@",geoPoint);
            
            
            
            
        
            self.searchZip.text =[self getAddressFromLatLon:geoPoint.latitude withLongitude:geoPoint.longitude];
            if (!error) {
                
            }
        }];

    } else{
        self.searchZip.text =@"";

    }
}


-(NSString *)getAddressFromLatLon:(double)currentLatitude withLongitude:(double)currentLongitude
{
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f",currentLatitude, currentLongitude];
    
    NSLog(@"%@",urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse * response = nil;
    
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary * resultsInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSDictionary * address = resultsInfo[@"results"][0];
    NSLog(@"%@",address);
    
    return address[@"formatted_address"];
}






/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */






@end
