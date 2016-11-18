//
//  Interview.m
//  eCampus
//
//  Created by liujianx on 15/9/4.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "Interview.h"

@implementation Interview
 
-(Interview *)initWithTitle :(NSString *)workDays
                   workHours:(NSString *)workHours
                    vacation:(NSString *)vacation
                      vacSlr:(NSString *)vacSlr
                      otTime:(NSString *)otTime
                       oriOT:(NSString *)oriOT
                       vacOT:(NSString *)vacOT
                       legOT:(NSString *)legOT
                  nightCount:(NSString *)nightCount
                    restTime:(NSString *)restTime
                        late:(NSString *)late
                    lateTime:(NSString *)lateTime
                       leave:(NSString *)leave
                      noCard:(NSString *)noCard
                      noWork:(NSString *)noWork
                       title:(NSString *)title
                   leaveTime:(NSString *)leaveTime
                  sleaveTime:(NSString *)sleaveTime  {
    
    if(self = [super init]){
        
        self.title = title;
        self.workDays = workDays;
        self.workHours = workHours;
        self.vacation = vacation;
        self.vacSlr = vacSlr;
        self.oriOT = oriOT;
        self.vacOT = vacOT;
        self.otTime = otTime;
        self.legOT = legOT;
        self.nightCount = nightCount;
        self.restTime = restTime;
        self.late = late;
        self.lateTime = lateTime;
        self.leave = leave;
        self.noCard = noCard;
        self.noWork = noWork;
        self.leaveTime = leaveTime;
        self.sleaveTime = sleaveTime;
        
    }
    return self;
}

@end
