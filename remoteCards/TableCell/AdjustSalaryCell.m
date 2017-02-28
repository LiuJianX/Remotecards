//
//  KaoQinResultCell.m
//  remoteCards
//
//  Created by liujianxiong on 2016/11/16.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import "AdjustSalaryCell.h"
#import "AdjustSalary.h"
#import "Utils.h"
#import "Common.h"


@implementation AdjustSalaryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self initControl];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)initControl{
    
    NSInteger y = 8,h = 25;
    CGFloat w = [Utils getScreenWidth] / 2;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"原职位:";
    [view1 addSubview:lbl];
    
    _lblPosition = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblPosition.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblPosition];
    
    
    [self addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调后职位:";
    [view2 addSubview:lbl];
    
    
    _lblAPosition = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblAPosition.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblAPosition];
    _lblAPosition.textColor = NavFontColor;
    [self addSubview:view2];
    
    /////////第2
    y = y + h;
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(8 , y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"原基本工资:";
    [view3 addSubview:lbl];
    
    _lblBasicSalary = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblBasicSalary.font = HYQIHEISIZE(14);
    //_lblBasicSalary.textColor = NavFontColor;

    [view3 addSubview:_lblBasicSalary];
    
    [self addSubview:view3];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调后基本工资:";
    [view2 addSubview:lbl];
    
    _lblABasicSalary = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblABasicSalary.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblABasicSalary];
    _lblABasicSalary.textColor = NavFontColor;
    
    
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    [self addSubview:view1];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"原奖金:";
    [view1 addSubview:lbl];
    _lblsBonus = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblsBonus.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblsBonus];
    
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调后奖金:";
    [view3 addSubview:lbl];
    
    _lblABonus = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblABonus.font = HYQIHEISIZE(14);
    [view3 addSubview:_lblABonus];
    _lblABonus.textColor = NavFontColor;
    [self addSubview:view3];
    
    //////////第三
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"原周六加班费:";
    [view1 addSubview:lbl];
    
    _lblsSatOvertime = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblsSatOvertime.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblsSatOvertime];
    [self addSubview:view1];
    
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调后周六加班费:";
    [view2 addSubview:lbl];
    
    
    _lblASatOvertime = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblASatOvertime.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblASatOvertime];
     _lblASatOvertime.textColor = NavFontColor;
    [self addSubview:view2];
    
    y = y + h;

    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 , y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"原话费补贴:";
    [view3 addSubview:lbl];
    
    _lblsPhone = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblsPhone.font = HYQIHEISIZE(14);
    [view3 addSubview:_lblsPhone];
    
    [self addSubview:view3];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调后话费补贴:";
    [view2 addSubview:lbl];
    
    _lblAPhone = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblAPhone.font = HYQIHEISIZE(14);
      _lblAPhone.textColor = NavFontColor;
    [view2 addSubview:_lblAPhone];
    
    [self addSubview:view2];
    
    //////////第四
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    
    [self addSubview:view1];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"原浮动津贴:";
    [view1 addSubview:lbl];
    
    _lblsFloatSalary = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblsFloatSalary.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblsFloatSalary];
    
  
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8   + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view3.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调后浮动津贴:";
    [view3 addSubview:lbl];
    
    _lblAFloatSalary = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblAFloatSalary.font = HYQIHEISIZE(14);
    _lblAFloatSalary.textColor = NavFontColor;
    [view3 addSubview:_lblAFloatSalary];
    
    [self addSubview:view3];
    
    
    ///////
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"原房补:";
        [view1 addSubview:lbl];
    
    _lblShouldHousing = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblShouldHousing.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblShouldHousing];

    [self addSubview:view1];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调后房补:";
    [view2 addSubview:lbl];
    
    _lblAShouldHousing = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblAShouldHousing.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblAShouldHousing];
    _lblAShouldHousing.textColor = NavFontColor;

    
    
    [self addSubview:view2];
    
    
    y = y + h;

    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 , y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"原税前工资:";
    [view3 addSubview:lbl];
    _lblTotalSalary = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblTotalSalary.font = HYQIHEISIZE(14);
   
    [view3 addSubview:_lblTotalSalary];
    
    
    
    
    [self addSubview:view3];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"调后税前工资:";
    [view2 addSubview:lbl];
    
    _lblATotalSalary = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblATotalSalary.font = HYQIHEISIZE(14);
    _lblATotalSalary.textColor = NavFontColor;
    [view2 addSubview:_lblATotalSalary];
    
    
    
    
}
- (void)setSalaryData:(AdjustSalary *)model{
 
    
    _lblPosition.text =  model.Position;
    _lblAPosition.text = model.APosition ;
    _lblBasicSalary.text = model.sBasicSalary ;
    _lblABasicSalary.text = model.ABasicSalary  ;
    _lblsBonus.text = model.sBonus  ;
    _lblABonus.text = model.ABonus ;
    _lblsSatOvertime.text = model.sSatOvertime;
    _lblASatOvertime.text = model.ASatOvertime  ;
    _lblsPhone.text = model.sPhone  ;
    _lblAPhone.text = model.APhone ;
    _lblsFloatSalary.text = model.sFloatSalary ;
    _lblAFloatSalary.text = model.AFloatSalary ;
    _lblPostionAllowance.text = model.PostionAllowance ;
    _lblShouldHousing.text = model.ShouldHousing  ;
    _lblAPostionAllowance.text = model.APostionAllowance ;
    _lblAShouldHousing.text = model.AShouldHousing ;
    _lblTotalSalary.text = model.TotalSalary ;
    _lblATotalSalary.text = model.ATotalSalary ;
}

@end
