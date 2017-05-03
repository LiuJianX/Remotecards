//
//  ProfileSalaryCell.m
//  remoteCards
//
//  Created by liujianxiong on 2016/11/16.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import "ProfileSalaryCell.h"
#import "Utils.h"
#import "Common.h"
#import "EMoney.h"

@implementation ProfileSalaryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self initContorl];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)initContorl{
    
    
    NSInteger y = 8,h = 25;
    CGFloat w = [Utils getScreenWidth] / 2;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"应发合计:";
   
    _lblTotalSalary = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblTotalSalary.font = HYQIHEISIZE(14);
    [view2 addSubview:lbl];
    [view2 addSubview:_lblTotalSalary];
    [view2 setHidden:YES];
    
   
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"实发合计:";
    _lblpPaySalary = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpPaySalary.font = HYQIHEISIZE(14);
    _lblpPaySalary.textColor  = NavFontColor;
    [view1 addSubview:_lblpPaySalary];
    [view1 addSubview:lbl];
    
    
    
    UIImageView *imgLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, [Utils getScreenWidth], 1)];
    imgLine.image = [UIImage imageNamed:@"login_textfield_mid"];
    [self addSubview:imgLine];
    

    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    [view2 setHidden:YES];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"应发底薪:";
    [view2 addSubview:lbl];
    _lblsBasicSalary = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblsBasicSalary.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblsBasicSalary];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"实发底薪:";
    [view1 addSubview:lbl];
    _lblpBasicSalary = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpBasicSalary.font = HYQIHEISIZE(14);
    _lblpBasicSalary.textColor  = NavFontColor;
    [view1 addSubview:_lblpBasicSalary];
    
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    [view2 setHidden:YES];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"应发奖金:";
    [view2 addSubview:lbl];
    _lblsBonus = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblsBonus.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblsBonus];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"实发奖金:";
    [view1 addSubview:lbl];
    _lblpBonus = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblpBonus.font = HYQIHEISIZE(14);
    _lblpBonus.textColor  = NavFontColor;
    [view1 addSubview:_lblpBonus];
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    [view2 setHidden:YES];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"应发周六加班费:";
    [view2 addSubview:lbl];
    _lblsSatOvertime = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblsSatOvertime.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblsSatOvertime];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"实发周六加班费:";
    [view1 addSubview:lbl];
    
    _lblpSatOvertime = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpSatOvertime.font = HYQIHEISIZE(14);
    _lblpSatOvertime.textColor  = NavFontColor;
    [view1 addSubview:_lblpSatOvertime];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    [view2 setHidden:YES];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"应发话费补贴:";
    [view2 addSubview:lbl];
    _lblsPhone = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblsPhone.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblsPhone];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"实发话费补贴:";
    [view1 addSubview:lbl];
    _lblpPhone = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpPhone.font = HYQIHEISIZE(14);
    _lblpPhone.textColor  = NavFontColor;
    [view1 addSubview:_lblpPhone];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    [view2 setHidden:YES];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"应发浮动工资:";
    [view2 addSubview:lbl];
    _lblsFloatSalary = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblsFloatSalary.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblsFloatSalary];
    
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"实发浮动工资:";
    [view1 addSubview:lbl];
    _lblpFloatSalary = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpFloatSalary.font = HYQIHEISIZE(14);
    _lblpFloatSalary.textColor  = NavFontColor;
    [view1 addSubview:_lblpFloatSalary];
    
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    [view2 setHidden:YES];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"应发职位津贴:";
    [view2 addSubview:lbl];
    _lblPostionAllowance = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblPostionAllowance.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblPostionAllowance];
    
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"实发职位津贴:"; [view1 addSubview:lbl];
    
    _lblpPostionAllowance = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpPostionAllowance.font = HYQIHEISIZE(14);
    _lblpPostionAllowance.textColor  = NavFontColor;
    
    [view1 addSubview:_lblpPostionAllowance];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    [view2 setHidden:YES];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"应发房补:";
    [view2 addSubview:lbl];
    _lblShouldHousing = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblShouldHousing.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblShouldHousing];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"实发房补:";
    [view1 addSubview:lbl];
    _lblpHousing = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpHousing.font = HYQIHEISIZE(14);
    _lblpHousing.textColor  = NavFontColor;
    
    [view1 addSubview:_lblpHousing];
    
       w = [Utils getScreenWidth] / 3;
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"扣公积金:";
    [view1 addSubview:lbl];
    _lblpFund = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpFund.font = HYQIHEISIZE(14);
    _lblpFund.textColor  = NavFontColor;
    
    [view1 addSubview:_lblpFund];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"社保基数:";
    [view2 addSubview:lbl];
    _lblpSocialSecurityBasic = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblpSocialSecurityBasic.font = HYQIHEISIZE(14);
    _lblpSocialSecurityBasic.textColor  = NavFontColor;
    [view2 addSubview:_lblpSocialSecurityBasic];
    
    imgLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, y, [Utils getScreenWidth], 1)];
    imgLine.image = [UIImage imageNamed:@"login_textfield_mid"];
    [self addSubview:imgLine];
    
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    [self addSubview:view3];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"扣所得税:";
    [view3 addSubview:lbl];
    
    _lblpCashSalary = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblpCashSalary.font = HYQIHEISIZE(14);
    _lblpCashSalary.textColor  = NavFontColor;
    
    [view3 addSubview:_lblpCashSalary];
    
    
    //////////
//  w = [Utils getScreenWidth] / 3;
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班费:";
    [view1 addSubview:lbl];
    _lblpOvertimeSalary = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpOvertimeSalary.font = HYQIHEISIZE(14);
    _lblpOvertimeSalary.textColor  = NavFontColor;
    
    [view1 addSubview:_lblpOvertimeSalary];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"扣迟到:";
    [view2 addSubview:lbl];
    
    _lblpLate = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblpLate.font = HYQIHEISIZE(14);
    _lblpLate.textColor  = NavFontColor;
    
    [view2 addSubview:_lblpLate];
    
     view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    [self addSubview:view3];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"扣社保:";
    [view3 addSubview:lbl];
    
    _lblpSocialSecurity = [[UILabel alloc] initWithFrame:CGRectMake(47, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblpSocialSecurity.font = HYQIHEISIZE(14);
    _lblpSocialSecurity.textColor  = NavFontColor;
    [view3 addSubview:_lblpSocialSecurity];
    
    
    ///////
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"旷工:";
    [view1 addSubview:lbl];
    _lblNoWork = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblNoWork.font = HYQIHEISIZE(14);
    _lblNoWork.textColor  = NavFontColor;
    [view1 addSubview:_lblNoWork];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"请假(时):";
    [view2 addSubview:lbl];
    
    _lblVacation = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblVacation.font = HYQIHEISIZE(14);
    _lblVacation.textColor  = NavFontColor;
    [view2 addSubview:_lblVacation];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    [self addSubview:view3];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"有薪假:";
    [view3 addSubview:lbl];
    
    _lblpLeaveSalary = [[UILabel alloc] initWithFrame:CGRectMake(47, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblpLeaveSalary.font = HYQIHEISIZE(14);
    _lblpLeaveSalary.textColor  = NavFontColor;
    
    [view3 addSubview:_lblpLeaveSalary];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"签卡(次):";
    [view1 addSubview:lbl];
    _lblsf_7 = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblsf_7.font = HYQIHEISIZE(14);
    _lblsf_7.textColor  = NavFontColor;
    [view1 addSubview:_lblsf_7];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调休(天):";
    [view2 addSubview:lbl];
    
    _lblsf_6 = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblsf_6.font = HYQIHEISIZE(14);
    _lblsf_6.textColor  = NavFontColor;
    [view2 addSubview:_lblsf_6];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    [self addSubview:view3];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"迟到(分):";
    [view3 addSubview:lbl];
    
    _lblLateTime = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblLateTime.font = HYQIHEISIZE(14);
    _lblLateTime.textColor  = NavFontColor;
    [view3 addSubview:_lblLateTime];
    
    
    imgLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, y, [Utils getScreenWidth], 1)];
    imgLine.image = [UIImage imageNamed:@"login_textfield_mid"];
    [self addSubview:imgLine];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班(工作日):";
    [view1 addSubview:lbl];
    _lblpOverTime1 = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpOverTime1.font = HYQIHEISIZE(14);
    _lblpOverTime1.textColor  = NavFontColor;
    [view1 addSubview:_lblpOverTime1];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班(周末):";
    [view2 addSubview:lbl];
    
    _lblpOverTime2 = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblpOverTime2.font = HYQIHEISIZE(14);
    _lblpOverTime2.textColor  = NavFontColor;
    [view2 addSubview:_lblpOverTime2];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    [self addSubview:view3];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班(节假日):";
    [view3 addSubview:lbl];
    
    _lblpOverTime3 = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblpOverTime3.font = HYQIHEISIZE(14);
    _lblpOverTime3.textColor  = NavFontColor;
    [view3 addSubview:_lblpOverTime3];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"出勤(工作日):";
    [view1 addSubview:lbl];
    _lblpAttendance1 = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpAttendance1.font = HYQIHEISIZE(14);
    _lblpAttendance1.textColor  = NavFontColor;
    [view1 addSubview:_lblpAttendance1];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"出勤(周末):";
    [view2 addSubview:lbl];
    
    _lblpAttendance2 = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblpAttendance2.font = HYQIHEISIZE(14);
    _lblpAttendance2.textColor  = NavFontColor;
    [view2 addSubview:_lblpAttendance2];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    [self addSubview:view3];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"出勤(节假日):";
    [view3 addSubview:lbl];
    
    _lblpAttendance3 = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblpAttendance3.font = HYQIHEISIZE(14);
    _lblpAttendance3.textColor  = NavFontColor;
    [view3 addSubview:_lblpAttendance3];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"缺勤(工作日):";
    [view1 addSubview:lbl];
    _lblpNoWork1 = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblpNoWork1.font = HYQIHEISIZE(14);
    _lblpNoWork1.textColor  = NavFontColor;
    [view1 addSubview:_lblpNoWork1];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"缺勤(周末):";
    [view2 addSubview:lbl];
    
    _lblpNoWork2 = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblpNoWork2.font = HYQIHEISIZE(14);
    _lblpNoWork2.textColor  = NavFontColor;
    
    [view2 addSubview:_lblpNoWork2];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    [self addSubview:view3];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"其他补扣:";
    [view3 addSubview:lbl];
    
    _lblpOther = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblpOther.font = HYQIHEISIZE(14);
    _lblpOther.textColor  = NavFontColor;
    [view3 addSubview:_lblpOther];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"全勤奖:";
    [view1 addSubview:lbl];
    _lblAttendancaBonus = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblAttendancaBonus.font = HYQIHEISIZE(14);
    _lblAttendancaBonus.textColor  = NavFontColor;
    [view1 addSubview:_lblAttendancaBonus];
    

}

-(void)setData:(EMoney *)model{
    
    _lblpPaySalary.text = model.pPaySalary ;
    _lblTotalSalary.text = model.TotalSalary ;
    _lblsBasicSalary.text = model.sBasicSalary;
    _lblpBasicSalary.text = model.pBasicSalary;
    _lblsBonus.text = model.sBonus;
    _lblShouldHousing.text = model.ShouldHousing ;
    _lblpBonus.text = model.pBonus ;
    _lblpOther.text = model.pOther;
    _lblsSatOvertime.text = model.sSatOvertime;
    _lblpSatOvertime.text = model.pSatOvertime;
    _lblsPhone.text = model.sPhone ;
    _lblpPhone.text = model.pPhone;
    _lblsFloatSalary.text = model.sFloatSalary;
    _lblpFloatSalary.text = model.pFloatSalary ;
    _lblPostionAllowance.text = model.PostionAllowance;
    _lblpPostionAllowance.text = model.pPostionAllowance ;
    _lblpHousing.text = model.pHousing;
    _lblpOvertimeSalary.text = model.pOvertimeSalary;
    _lblpLate.text = model.pLate ;
    _lblpFund.text = model.pFund ;
    _lblpSocialSecurity.text = model.pSocialSecurity ;
    _lblpSocialSecurityBasic.text = model.pSocialSecurityBasic ;
    _lblsf_7.text = model.sf_7 ;
    _lblpCashSalary.text = model.pCashSalary;
    _lblsf_6.text = model.sf_6;
    _lblLateTime.text = model.LateTime ;
    _lblVacation.text = model.Vacation ;
    _lblNoWork.text = model.NoWork;
    _lblpOverTime1.text = model.pOverTime1 ;
    _lblpOverTime2.text = model.pOverTime2;
    _lblpOverTime3.text = model.pOverTime3 ;
    _lblpLeaveSalary.text = model.pLeaveSalary ;
    _lblpNoWork1.text = model.pNoWork1;
    _lblpNoWork2.text = model.pNoWork2;
    _lblpAttendance1.text = model.pAttendance1 ;
    _lblpAttendance2.text = model.pAttendance2 ;
    _lblpAttendance3.text = model.pAttendance3 ;
    _lblAttendancaBonus.text = model.AttendancaBonus;
    
}

@end
