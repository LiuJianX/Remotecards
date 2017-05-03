//
//  KaoQinResultCell.h
//  remoteCards
//
//  Created by liujianxiong on 2016/11/16.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AdjustSalary.h"

@interface AdjustSalaryCell : UITableViewCell


@property (nonatomic,strong) UILabel *lblPosition;
@property (nonatomic,strong) UILabel *lblAPosition;
@property (nonatomic,strong) UILabel *lblBasicSalary;
@property (nonatomic,strong) UILabel *lblABasicSalary;
@property (nonatomic,strong) UILabel *lblsBonus;
@property (nonatomic,strong) UILabel *lblABonus;
@property (nonatomic,strong) UILabel *lblsSatOvertime;
@property (nonatomic,strong) UILabel *lblASatOvertime;
@property (nonatomic,strong) UILabel *lblsPhone;
@property (nonatomic,strong) UILabel *lblAPhone;
@property (nonatomic,strong) UILabel *lblsFloatSalary;
@property (nonatomic,strong) UILabel *lblAFloatSalary;
@property (nonatomic,strong) UILabel *lblPostionAllowance;
@property (nonatomic,strong) UILabel *lblAPostionAllowance;
@property (nonatomic,strong) UILabel *lblShouldHousing;
@property (nonatomic,strong) UILabel *lbltitle;
@property (nonatomic,strong) UILabel *lblAShouldHousing;
@property (nonatomic,strong) UILabel *lblTotalSalary;
@property (nonatomic,strong) UILabel *lblATotalSalary;
@property (nonatomic,strong) UILabel *lblAttendancaBonus;
@property (nonatomic,strong) UILabel *lblAAttendancaBonus;

- (void)setSalaryData:(AdjustSalary *)model;

@end
