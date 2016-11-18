//
//  KaoQinResultCell.h
//  remoteCards
//
//  Created by liujianxiong on 2016/11/16.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Interview.h"

@interface KaoQinResultCell : UITableViewCell


@property (nonatomic,strong) UILabel *lblworDays;
@property (nonatomic,strong) UILabel *lblworkHours;
@property (nonatomic,strong) UILabel *lblvacation;
@property (nonatomic,strong) UILabel *lblvacSlr;
@property (nonatomic,strong) UILabel *lblotTime;
@property (nonatomic,strong) UILabel *lbloriOT;
@property (nonatomic,strong) UILabel *lblvacOT;
@property (nonatomic,strong) UILabel *lbllegOT;
@property (nonatomic,strong) UILabel *lblnightCount;
@property (nonatomic,strong) UILabel *lblrestTime;
@property (nonatomic,strong) UILabel *lbllate;
@property (nonatomic,strong) UILabel *lbllateTime;
@property (nonatomic,strong) UILabel *lblleave;
@property (nonatomic,strong) UILabel *lblnoCard;
@property (nonatomic,strong) UILabel *lblnoWork;
@property (nonatomic,strong) UILabel *lbltitle;
@property (nonatomic,strong) UILabel *lblleaveTime;
@property (nonatomic,strong) UILabel *lblsLeaveTime;

- (void)setData:(Interview *)model;

@end
