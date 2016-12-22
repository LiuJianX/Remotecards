//
//  Jobs.h
//  eCampus
//
//  Created by liujianx on 15/8/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Jobs : NSObject


@property (nonatomic,copy) NSString *weekDate;
@property (nonatomic,copy) NSString *tDate;
@property (nonatomic,copy) NSString *emp_ID;
@property (nonatomic,copy) NSString *workIn1;
@property (nonatomic,copy) NSString *workIn2;
@property (nonatomic,copy) NSString *workOut1;
@property (nonatomic,copy) NSString *workOut2;
@property (nonatomic,copy) NSString *otIn1;
@property (nonatomic,copy) NSString *otOut1;
@property (nonatomic,copy) NSString *leave;
@property (nonatomic,copy) NSString *ot;
@property (nonatomic,copy) NSString *late;
@property (nonatomic,copy) NSString *noWork;
@property (nonatomic,copy) NSString *noCard;
@property (nonatomic,copy) NSString *vacation;
@property (nonatomic,copy) NSString *workHour;
@property (nonatomic,copy) NSString *restHour;
@property (nonatomic,copy) NSString *workType;
@property (nonatomic,copy) NSString *workDays;
@property (nonatomic,copy) NSString *vac;
@property (nonatomic,copy) NSString *remark;
@property (nonatomic,copy) NSString *rplDirect;
@property (nonatomic,copy) NSString *rplHour;
@property (nonatomic,copy) NSString *kResult;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *departName;
@property (nonatomic,copy) NSString *duty;
@property (nonatomic,copy) NSString *position;
@property (nonatomic,copy) NSString *otIn2;
@property (nonatomic,copy) NSString *otOut2;







-(Jobs *)initWithTitle :(NSString *)weekDate tDate:(NSString *)tDate emp_ID:(NSString *)emp_ID workIn1:(NSString *)workIn1 workIn2:(NSString *)workIn2 workOut1:(NSString *) workOut1 workOut2:(NSString *)workOut2 otIn1:(NSString *)otIn1 otOut1:(NSString *)otOut1 leave:(NSString *)leave ot:(NSString *)ot late:(NSString *)late noWork:(NSString *)noWork noCard:(NSString *)noCard vacation:(NSString *)vacation workHour:(NSString *)workHour restHour:(NSString *)restHour workType:(NSString *)workType workDays:(NSString *)workDays vac:(NSString *)vac remark:(NSString *)remark rplDirect:(NSString *)rplDirect rplHour:(NSString *)rplHour kResult:(NSString *)kResult name:(NSString *)name departName:(NSString *) departName duty:(NSString *)duty position:(NSString *)position otIn2:(NSString *) otIn2 otOut2:(NSString *)otOut2;



@end
