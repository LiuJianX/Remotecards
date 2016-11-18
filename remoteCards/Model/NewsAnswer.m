//
//  NewsAnswer.m
//  eCampus
//
//  Created by liujianx on 15/8/13.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "NewsAnswer.h"

@implementation NewsAnswer

-(NewsAnswer *)initWithQuestion :(NSString *)question questionID:(NSInteger)questionID answerA:(NSString *)answerA answerB:(NSString *)answerB answerC:(NSString *)answerC answerD:(NSString *)answerD answerAID:(NSInteger)answerAID answerBID:(NSInteger)answerBID answerCID:(NSInteger)answerCID answerDID:(NSInteger)answerDID answer:(NSInteger )answer userAnswer:(NSInteger)userAnswer newId:(NSInteger) newId isNetwork:(NSInteger) isNetwork{
    
    if(self=[super init]){
        
        self.question = question;
        self.questionID = questionID;
        self.answerA = answerA;
        self.answerB = answerB;
        self.answerC = answerC;
        self.answerD = answerD;
        self.answerAID = answerAID;
        self.answerBID = answerBID;
        self.answerCID = answerCID;
        self.answerDID = answerDID;
        self.answer = answer;
        self.userAnswer = userAnswer;
        self.newId = newId;
        self.isNetwork = isNetwork;
    }
    return self;
}


@end
