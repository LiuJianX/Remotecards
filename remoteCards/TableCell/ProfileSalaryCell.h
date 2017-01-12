//
//  ProfileSalaryCell.h
//  remoteCards
//
//  Created by liujianxiong on 2016/11/16.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMoney.h"

@interface ProfileSalaryCell : UITableViewCell



@property (nonatomic,strong) UILabel *lblpPaySalary;
@property (nonatomic,strong) UILabel *lblTotalSalary;
@property (nonatomic,strong) UILabel *lblsBasicSalary;
@property (nonatomic,strong) UILabel *lblpBasicSalary;
@property (nonatomic,strong) UILabel *lblShouldHousing;
@property (nonatomic,strong) UILabel *lblpBonus;

@property (nonatomic,strong) UILabel *lblsBonus;

@property (nonatomic,strong) UILabel *lblpOther;
@property (nonatomic,strong) UILabel *lblsSatOvertime;
@property (nonatomic,strong) UILabel *lblpSatOvertime;
@property (nonatomic,strong) UILabel *lblsPhone;
@property (nonatomic,strong) UILabel *lblpPhone;
@property (nonatomic,strong) UILabel *lblsFloatSalary;
@property (nonatomic,strong) UILabel *lblpFloatSalary;
@property (nonatomic,strong) UILabel *lblPostionAllowance;
@property (nonatomic,strong) UILabel *lblpPostionAllowance;
@property (nonatomic,strong) UILabel *lblpHousing;
@property (nonatomic,strong) UILabel *lblpOvertimeSalary;
@property (nonatomic,strong) UILabel *lblpLate;
@property (nonatomic,strong) UILabel *lblpFund;
@property (nonatomic,strong) UILabel *lblpSocialSecurity;
@property (nonatomic,strong) UILabel *lblpSocialSecurityBasic;
@property (nonatomic,strong) UILabel *lblsf_7;
@property (nonatomic,strong) UILabel *lblsf_6;
@property (nonatomic,strong) UILabel *lblLateTime;
@property (nonatomic,strong) UILabel *lblVacation;
@property (nonatomic,strong) UILabel *lblNoWork;
@property (nonatomic,strong) UILabel *lblpOverTime1;
@property (nonatomic,strong) UILabel *lblpOverTime2;
@property (nonatomic,strong) UILabel *lblpOverTime3;
@property (nonatomic,strong) UILabel *lblpLeaveSalary;
@property (nonatomic,strong) UILabel *lblpNoWork1;
@property (nonatomic,strong) UILabel *lblpNoWork2;
@property (nonatomic,strong) UILabel *lblpAttendance1;
@property (nonatomic,strong) UILabel *lblpAttendance2;
@property (nonatomic,strong) UILabel *lblpAttendance3;

-(void)setData:(EMoney *)model ;


@end
