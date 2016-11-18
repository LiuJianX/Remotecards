//
//  NewsAnswer.h
//  eCampus
//
//  Created by liujianx on 15/8/13.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsAnswer : NSObject

@property (nonatomic,assign) NSInteger newId;
@property (nonatomic,copy) NSString *question;

@property (nonatomic,copy) NSString *questionImage;

@property (nonatomic,assign) NSInteger questionID;
@property (nonatomic,copy) NSString *answerA;
@property (nonatomic,copy) NSString *answerB;
@property (nonatomic,copy) NSString *answerC;
@property (nonatomic,copy) NSString *answerD;


@property (nonatomic,assign) NSInteger answerAID;
@property (nonatomic,assign) NSInteger answerBID;
@property (nonatomic,assign) NSInteger answerCID;
@property (nonatomic,assign) NSInteger answerDID;
@property (nonatomic,assign) NSInteger answer;
@property (nonatomic,assign) NSInteger userAnswer;

@property (nonatomic,assign) NSInteger questionType;
@property (nonatomic,copy) NSString *questionAnswer;

@property (nonatomic,assign) NSInteger rowIndex;
@property (nonatomic,assign) BOOL isSubmit;

@property (nonatomic,copy) NSString *answerTip;
@property (nonatomic,assign) NSInteger isNetwork;








-(NewsAnswer *)initWithQuestion :(NSString *)question questionID:(NSInteger)questionID answerA:(NSString *)answerA answerB:(NSString *)answerB answerC:(NSString *)answerC answerD:(NSString *)answerD answerAID:(NSInteger)answerAID answerBID:(NSInteger)answerBID answerCID:(NSInteger)answerCID answerDID:(NSInteger)answerDID answer:(NSInteger )answer userAnswer:(NSInteger)userAnswer newId:(NSInteger) newId isNetwork:(NSInteger) isNetwork;





@end
