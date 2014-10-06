//
//  QueryResultsTVC.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 10/4/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "QueryResultsTVC.h"
#import "QueryResultsCellTableViewCell.h"

@interface QueryResultsTVC ()

@end

@implementation QueryResultsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"profilesCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
