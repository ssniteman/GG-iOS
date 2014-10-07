//
//  QueryResultsTVC.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 10/4/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "QueryResultsTVC.h"
#import "QueryResultsCell.h"


@interface QueryResultsTVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation QueryResultsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    QueryResultsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"profilesCell"];
    
    if (cell == nil) {
        cell = [[QueryResultsCell alloc]init];
    }
    // Configure the cell...
    
    
    return cell;
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
