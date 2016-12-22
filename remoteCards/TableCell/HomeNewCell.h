//
//  HomeNewCell.h
//  eCampus
//
//  Created by liujianx on 15/10/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jobs.h"

@interface HomeNewCell : UITableViewCell

@property (strong, nonatomic)  UILabel *lblDate;
@property (nonatomic,strong) UILabel *lbltDate;
@property (nonatomic,strong) UILabel *lblEmp_ID;
@property (nonatomic,strong) UILabel *lblWorkIn1;
@property (nonatomic,strong) UILabel *lblWorkIn2;
@property (nonatomic,strong) UILabel *lblWorkOut1;
@property (nonatomic,strong) UILabel *lblWorkOut2;
@property (nonatomic,strong) UILabel *lblOtIn1;
@property (nonatomic,strong) UILabel *lblOtOut1;
@property (nonatomic,strong) UILabel *lblLeave;
@property (nonatomic,strong) UILabel *lblLate;
@property (nonatomic,strong) UILabel *lblot;
@property (nonatomic,strong) UILabel *lblNoWork;
@property (nonatomic,strong) UILabel *lblNoCard;
@property (nonatomic,strong) UILabel *lblVacation;
@property (nonatomic,strong) UILabel *lblWorkHour;
@property (nonatomic,strong) UILabel *lblRestHour;
@property (nonatomic,strong) UILabel *lblWorkType;
@property (nonatomic,strong) UILabel *lblWorkDays;
@property (nonatomic,strong) UILabel *lblVac;
@property (nonatomic,strong) UILabel *lblRemark;
@property (nonatomic,strong) UILabel *lblRplDirect;
@property (nonatomic,strong) UILabel *lblRplHour;
@property (nonatomic,strong) UILabel *lblkResult;
@property (nonatomic,strong) UILabel *lblName;
@property (nonatomic,strong) UILabel *lblDepartName;
@property (nonatomic,strong) UILabel *lblDuty;
@property (nonatomic,strong) UILabel *lblPosition;
@property (nonatomic,strong) UILabel *lblWeekDate;
@property (nonatomic,strong) UILabel *lblOtIn2;
@property (nonatomic,strong) UILabel *lblOtOut2;




/**
 *  设置新闻标题内容
 *
 *  @param model 新闻数据对象
 */
- (void)setNewsData:(Jobs *)model;

@property (nonatomic, strong) Jobs *news;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;



@end
