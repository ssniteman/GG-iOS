//
//  QueryResultsCell.h
//  SidebarDemo
//
//  Created by Shane Sniteman on 10/6/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QueryResultsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *resultPhoto;

@property (weak, nonatomic) IBOutlet UILabel *resultBandName;


@property (weak, nonatomic) IBOutlet UILabel *resultCityLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultGenreLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultAvailabilityLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultRateLabel;


@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end