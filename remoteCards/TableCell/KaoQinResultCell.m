//
//  KaoQinResultCell.m
//  remoteCards
//
//  Created by liujianxiong on 2016/11/16.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import "KaoQinResultCell.h"
#import "Interview.h"
#import "Utils.h"
#import "Common.h"


@implementation KaoQinResultCell

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
    lbl.text = @"出勤天数:";
    [view1 addSubview:lbl];
    
    _lblworDays = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblworDays.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblworDays];
    
    
    [self addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"出勤小时:";
    [view2 addSubview:lbl];
    
    
    _lblworkHours = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblworkHours.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblworkHours];
    
    [self addSubview:view2];
    
    /////////第2
    y = y + h;
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(8 , y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"请假时长:";
    [view3 addSubview:lbl];
    
    _lblvacation = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblvacation.font = HYQIHEISIZE(14);
    _lblvacation.textColor = NavFontColor;

    [view3 addSubview:_lblvacation];
    
    [self addSubview:view3];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"有薪假(H):";
    [view2 addSubview:lbl];
    
    _lblvacSlr = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblvacSlr.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblvacSlr];

    
    
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    [self addSubview:view1];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班时长:";
    [view1 addSubview:lbl];
    _lblotTime = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblotTime.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblotTime];
    
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"延时加班:";
    [view3 addSubview:lbl];
    
    _lbloriOT = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lbloriOT.font = HYQIHEISIZE(14);
    [view3 addSubview:_lbloriOT];
    
    [self addSubview:view3];
    
    //////////第三
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"休日加班:";
    [view1 addSubview:lbl];
    
    _lblvacOT = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblvacOT.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblvacOT];
    [self addSubview:view1];
    
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"假日加班:";
    [view2 addSubview:lbl];
    
    
    _lbllegOT = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lbllegOT.font = HYQIHEISIZE(14);
    [view2 addSubview:_lbllegOT];
    
    [self addSubview:view2];
    
    y = y + h;

    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 , y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"夜班次数:";
    [view3 addSubview:lbl];
    
    _lblnightCount = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblnightCount.font = HYQIHEISIZE(14);
    [view3 addSubview:_lblnightCount];
    
    [self addSubview:view3];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"停工时长:";
    [view2 addSubview:lbl];
    
    _lblrestTime = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblrestTime.font = HYQIHEISIZE(14);
      _lblrestTime.textColor = NavFontColor;
    [view2 addSubview:_lblrestTime];
    
    [self addSubview:view2];
    
    //////////第四
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    
    [self addSubview:view1];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"迟到次数:";
    [view1 addSubview:lbl];
    
    _lbllate = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lbllate.font = HYQIHEISIZE(14);
    _lbllate.textColor = NavFontColor;
    [view1 addSubview:_lbllate];
    
  
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8   + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view3.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"迟到分钟:";
    [view3 addSubview:lbl];
    
    _lbllateTime = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lbllateTime.font = HYQIHEISIZE(14);
    _lbllateTime.textColor = NavFontColor;
    [view3 addSubview:_lbllateTime];
    
    [self addSubview:view3];
    
    
    ///////
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"早退次数:";
        [view1 addSubview:lbl];
    
    _lblleave = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblleave.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblleave];
    _lblleave.textColor = NavFontColor;

    [self addSubview:view1];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"早退分钟:";
    [view2 addSubview:lbl];
    
    _lblleaveTime = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblleaveTime.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblleaveTime];
    _lblleaveTime.textColor = NavFontColor;

    
    
    [self addSubview:view2];
    
    
    y = y + h;

    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 , y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"缺卡次数:";
    [view3 addSubview:lbl];
    
    _lblnoCard = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblnoCard.font = HYQIHEISIZE(14);
    _lblnoCard.textColor = NavFontColor;
    [view3 addSubview:_lblnoCard];
    
    
    
    
    [self addSubview:view3];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    [self addSubview:view2];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"旷工长时:";
    [view2 addSubview:lbl];
    
    _lblnoWork = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblnoWork.font = HYQIHEISIZE(14);
       _lblnoWork.textColor = NavFontColor;
    [view2 addSubview:_lblnoWork];
    
    ///////
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    
    [self addSubview:view1];
    
    
       lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"所剩年假:";
    [view1 addSubview:lbl];
    
    _lblsLeaveTime = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblsLeaveTime.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblsLeaveTime];
    
    
 
    
    
    
}
- (void)setData:(Interview *)model{

    _lblworDays.text =  model.workDays;
    _lblworkHours.text = model.workHours ;
    _lblvacation.text = model.vacation ;
    _lblvacSlr.text = model.vacSlr  ;
    _lblotTime.text = model.otTime  ;
    _lbloriOT.text = model.oriOT ;
    _lblvacOT.text = model.vacOT;
    _lbllegOT.text = model.legOT  ;
    _lblnightCount.text = model.nightCount  ;
    _lblrestTime.text = model.restTime ;
    _lbllate.text = model.late ;
    _lblleaveTime.text = model.leaveTime ;
    _lblleave.text = model.leave ;
    _lblnoCard.text = model.noCard  ;
    _lblnoWork.text = model.noWork ;
    _lbllateTime.text = model.lateTime ;
    _lblsLeaveTime.text = model.sleaveTime ;
 
}

@end
