//
//  HomeNewCell.m
//  eCampus
//
//  Created by liujianx on 15/10/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "HomeNewCell.h"
#import "Jobs.h"
#import "Utils.h"
#import "Common.h"


@implementation HomeNewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    [self initControl];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)initControl{
    
    NSInteger y = 8,h = 25;
    CGFloat w = [Utils getScreenWidth] / 3;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"日期:";
    [view1 addSubview:lbl];
    
    _lblDate = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblDate.font = HYQIHEISIZE(14); 
    [view1 addSubview:_lblDate];
    
    
    [self addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
     
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"班别:";
    [view2 addSubview:lbl];
    
    
    _lblWeekDate = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblWeekDate.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblWeekDate];
    
    [self addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"结果:";
    [view3 addSubview:lbl];
    
    _lblkResult = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblkResult.font = HYQIHEISIZE(14);
    [view3 addSubview:_lblkResult];
    
    [self addSubview:view3];
    
    
    /////////第2
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"工作:";
    [view1 addSubview:lbl];
    
    _lblWorkHour = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblWorkHour.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblWorkHour];
    
    
    [self addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班:";
    [view2 addSubview:lbl];
    
    
    _lblot = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblot.font = HYQIHEISIZE(14);
    
    [view2 addSubview:_lblot];
    
    [self addSubview:view2];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"迟到:";
    
    [view3 addSubview:lbl];
    
    _lblLate = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblLate.font = HYQIHEISIZE(14);
     _lblLate.textColor = NavFontColor;
    [view3 addSubview:_lblLate];
    
    [self addSubview:view3];
    
    //////////第三
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"早退:";
    [view1 addSubview:lbl];
    
    _lblLeave = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblLeave.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblLeave];
     _lblLeave.textColor = NavFontColor;
    [self addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"缺卡:";
    [view2 addSubview:lbl];
    
    
    _lblNoCard = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblNoCard.font = HYQIHEISIZE(14);
     _lblNoCard.textColor = NavFontColor;
    [view2 addSubview:_lblNoCard];
    
    [self addSubview:view2];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view3.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"旷工:";
    [view3 addSubview:lbl];
    
    _lblNoWork = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblNoWork.font = HYQIHEISIZE(14);
     _lblNoWork.textColor = NavFontColor;
    [view3 addSubview:_lblNoWork];
    
    [self addSubview:view3];
    
    
    //////////第四
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"假别:";
    [view1 addSubview:lbl];
    
    _lblVac = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblVac.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblVac];
    
    
    [self addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"请假:";
    [view2 addSubview:lbl];
    
    _lblVacation = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblVacation.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblVacation];
      _lblVacation.textColor = NavFontColor;
    
    [self addSubview:view2];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    
    
    [self addSubview:view3];
    
    
    //////////第5
    y = y + h;
    
    w =  [Utils getScreenWidth]  / 2;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"上班一:";
    [view1 addSubview:lbl];
    
    _lblWorkIn1 = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblWorkIn1.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblWorkIn1];
    
    
    [self addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"下班一:";
    [view2 addSubview:lbl];
    
    _lblWorkOut1 = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblWorkOut1.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblWorkOut1];
    
    [self addSubview:view2];
    
    
    //////////第6
    
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"上班二:";
    [view1 addSubview:lbl];
    
    _lblWorkIn2 = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblWorkIn2.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblWorkIn2];
    
    
    [self addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"下班二:";
    [view2 addSubview:lbl];
    
    _lblWorkOut2 = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblWorkOut2.font = HYQIHEISIZE(14);
    
    [view2 addSubview:_lblWorkOut2];
    
    [self addSubview:view2];
    
    //////////第7
    
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班上:";
    [view1 addSubview:lbl];
    
    _lblOtIn1 = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblOtIn1.font = HYQIHEISIZE(14);
      [view1 addSubview:_lblOtIn1];
    
    
    [self addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班下:";
    [view2 addSubview:lbl];
    
    _lblOtOut1 = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblOtOut1.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblOtOut1];
    

    [self addSubview:view2];

    
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班二上:";
    [view1 addSubview:lbl];
    
    _lblOtIn2 = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblOtIn2.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblOtIn2];
    
    
    [self addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"加班二下:";
    [view2 addSubview:lbl];
    
    _lblOtOut2 = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblOtOut2.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblOtOut2];
    
    
    [self addSubview:view2];
    

    
    y = y + h;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"备注:";
    [view1 addSubview:lbl];
    
    _lblRemark = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblRemark.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblRemark];
    [self addSubview:view1];
    
}


/**
 *  设置新闻标题内容
 *
 *  @param model 新闻数据对象
 */
- (void)setNewsData:(Jobs *)news{

    
    _lblDate.text = news.tDate;
    //_lbltDate.text = news.tDate;
  //  _lblEmp_ID.text = news.emp_ID;
    _lblWorkIn1.text = news.workIn1;
    _lblWorkIn2.text = news.workIn2;
    _lblWorkOut1.text = news.workOut1;
    _lblWorkOut2.text = news.workOut2;
    _lblOtIn1.text = news.otIn1;
    _lblOtOut1.text = news.otOut1;
    _lblLeave.text = news.leave;
    _lblLate.text = news.late;
    _lblot.text = news.ot;
    _lblNoWork.text = news.noWork;
    _lblNoCard.text = news.noCard;
    _lblVacation.text = news.vacation;
    _lblWorkHour.text = news.workHour;
    
    _lblOtIn2.text = news.otIn2;
    _lblOtOut2.text = news.otOut2;
    
   // _lblRestHour.text = news.restHour;
   // _lblWorkType.text = news.workType;
   // _lblWorkDays.text = news.workDays;
    _lblVac.text = news.vac;
    _lblRemark.text = news.remark;
   // _lblRplDirect.text = news.rplDirect;
   // _lblRplHour.text = news.rplHour;
    
    _lblkResult.text = news.kResult;
    if(! [news.kResult isEqualToString:@"正常"]){
        _lblkResult.textColor = NavFontColor;
        _lblDate.textColor = NavFontColor;
         _lblWeekDate.textColor = NavFontColor;
    }
    
   // _lblName.text = news.name;
   // _lblDepartName.text = news.departName;
    //_lblDuty.text = news.duty;
    //_lblPosition.text = news.position;
    _lblWeekDate.text = news.weekDate;

   
}


@end
