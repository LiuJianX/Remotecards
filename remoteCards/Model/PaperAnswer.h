//
//  PaperAnswer.h
//  eCampus
//
//  Created by liujianx on 15/8/2.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaperAnswer : NSObject

@property (nonatomic, assign) NSInteger answerId;
@property (nonatomic, retain) NSString *answerTitle;
@property (nonatomic, retain) NSString *answerName;
@property(nonatomic,retain)  NSString *answerWritting;
@property(nonatomic,retain)  NSString *questionId;


@end
