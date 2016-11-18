//
//  AnswerData.m
//  eCampus
//
//  Created by liujianx on 15/8/27.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "AnswerData.h"

@implementation AnswerData
@synthesize  questionAsnwer;


- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.questionAsnwer forKey:@"questionAsnwer"];
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.questionAsnwer = [decoder decodeObjectForKey:@"questionAsnwer"];
    }
    return  self;
}


@end
