//
//  PaperAnswer.m
//  eCampus
//
//  Created by liujianx on 15/8/2.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "PaperAnswer.h"

@implementation PaperAnswer
@synthesize answerId,answerName,answerTitle,answerWritting,questionId;



- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger:(int) answerId forKey:@"answerId"];
    [encoder encodeObject:answerName forKey:@"answerName"];
    [encoder encodeObject:answerTitle forKey:@"answerTitle"];
    [encoder encodeObject:answerWritting forKey:@"answerWritting"];
     [encoder encodeObject:questionId forKey:@"questionId"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.answerName = [decoder decodeObjectForKey:@"answerName"];
        self.answerId = (int )[decoder decodeIntegerForKey:@"answerId"];
        self.answerTitle = [decoder decodeObjectForKey:@"answerTitle"];
        self.answerWritting = [decoder decodeObjectForKey:@"answerWritting"];
          self.questionId = [decoder decodeObjectForKey:@"questionId"];
        
    }
    return  self;
}


@end
