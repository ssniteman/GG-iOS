//
//  QueryResultsCell.m
//  SidebarDemo
//
//  Created by Shane Sniteman on 10/6/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "QueryResultsCell.h"
#import "QueryResultsTVC.h"
#import <Parse/Parse.h>
@implementation QueryResultsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setUsersContent:(NSDictionary *)usersContent{
    _usersContent  = usersContent;
//    @property (weak, nonatomic) IBOutlet UILabel *resultBandName;
//    
//    
//    @property (weak, nonatomic) IBOutlet UILabel *resultCityLabel;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *resultGenreLabel;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *resultAvailabilityLabel;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *resultRateLabel;
//       PFObject * user = self.usersContent;

    self.resultBandName.text = self.usersContent[@"bandName"];
    
//    NSLog(@"%@",usersContent);
}

@end
