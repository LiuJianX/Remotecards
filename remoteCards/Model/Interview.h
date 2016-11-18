//
//  Interview.h
//  eCampus
//
//  Created by liujianx on 15/9/4.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interview : NSObject

 
@property (nonatomic,copy) NSString *workDays;
@property (nonatomic,copy) NSString *workHours;
@property (nonatomic,copy) NSString *vacation;
@property (nonatomic,copy) NSString *vacSlr;
@property (nonatomic,copy) NSString *otTime;
@property (nonatomic,copy) NSString *oriOT;
@property (nonatomic,copy) NSString *vacOT;
@property (nonatomic,copy) NSString *legOT;
@property (nonatomic,copy) NSString *nightCount;
@property (nonatomic,copy) NSString *restTime;
@property (nonatomic,copy) NSString *late;
@property (nonatomic,copy) NSString *lateTime;
@property (nonatomic,copy) NSString *leave;
@property (nonatomic,copy) NSString *noCard;
@property (nonatomic,copy) NSString *noWork;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *leaveTime;
@property (nonatomic,copy) NSString *sleaveTime;


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
                   sleaveTime:(NSString *)sleaveTime ;


@end
