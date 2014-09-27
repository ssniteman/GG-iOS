//
//  EditGenreTVC.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 9/27/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "EditGenreTVC.h"

@interface EditGenreTVC ()

@end

@implementation EditGenreTVC {
    
    NSArray * genreList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    genreList = @[@"Acoustic", @"Alternative Rock", @"Ambient", @"Americana", @"Blues", @"Bluegrass", @"Classical", @"Classic Rock", @"Country", @"Dance", @"Disco", @"Dubstep", @"Electro", @"Electronic", @"Folk", @"Gospel", @"Hip-Hop", @"House", @"Indie", @"Jazz", @"Latin", @"Metal", @"Oldies", @"Other", @"Piano", @"Pop", @"Pop/Country", @"Progressive House", @"Punk", @"R&B", @"Rap", @"Reggae", @"Rock", @"Singer-Songwriter", @"Soul", @"Southern Rock", @"Techno", @"Trance"];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return genreList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = genreList[indexPath.row];
    
    return cell;
}





@end
