//
//  Jobs.m
//  eCampus
//
//  Created by liujianx on 15/8/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "Jobs.h"

@implementation Jobs


-(Jobs *)initWithTitle :(NSString *)weekDate tDate:(NSString *)tDate emp_ID:(NSString *)emp_ID
                workIn1:(NSString *)workIn1 workIn2:(NSString *)workIn2 workOut1:(NSString *)workOut1
               workOut2:(NSString *)workOut2 otIn1:(NSString *)otIn1 otOut1:(NSString *)otOut1
                  leave:(NSString *)leave ot:(NSString *)ot late:(NSString *)late
                 noWork:(NSString *)noWork noCard:(NSString *)noCard vacation:(NSString *)vacation
               workHour:(NSString *)workHour restHour:(NSString *)restHour workType:(NSString *)workType
               workDays:(NSString *)workDays vac:(NSString *)vac remark:(NSString *)remark
              rplDirect:(NSString *)rplDirect rplHour:(NSString *)rplHour kResult:(NSString *)kResult
                   name:(NSString *)name departName:(NSString *) departName duty:(NSString *)duty
               position:(NSString *)position{
    
    if(self = [super init]){
        
        self.weekDate = weekDate;
        self.tDate = tDate;
        self.emp_ID = emp_ID;
        self.workIn1 = workIn1;
        self.workIn2 = workIn2;
        self.workOut1 = workOut1;
        self.workOut2 = workOut2;
        self.otIn1 = otIn1;
        self.otOut1 = otOut1;
        self.leave = leave;
        self.ot = ot;
        self.late = late;
        self.noWork = noWork;
        self.noCard = noCard;
        self.vacation = vacation;
        self.workHour = workHour;
        self.restHour = restHour;
        self.workType = workType;
        self.workDays = workDays;
        self.vac = vac;
        self.remark = remark;
        self.rplDirect = rplDirect;
        self.rplHour = rplHour;
        self.kResult = kResult;
        self.name = name;
        self.departName = departName;
        self.duty = duty;
        self.position = position;
    }
    
    
    return self;
}

@end
