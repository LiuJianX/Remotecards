//
//  ExamResult.m
//  eCampus
//
//  Created by liujianx on 15/7/28.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "ExamResult.h"

@implementation ExamResult

// 当将一个自定义对象保存到文件的时候就会调用该方法
 // 在该方法中说明如何存储自定义对象的属性
// 也就说在该方法中说清楚存储自定义对象的哪些属性

@synthesize questionID,answerID,answerFlg,answerName,paperCode,paperPassWord,seq,randomID;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger: questionID forKey:@"questionID"];
    [encoder encodeInteger: answerID forKey:@"answerID"];
    [encoder encodeInteger:seq forKey:@"seq"];
    [encoder encodeInteger: randomID forKey:@"randomID"];
    [encoder encodeObject:answerName forKey:@"answerName"];
    [encoder encodeBool: (BOOL)answerFlg forKey:@"answerFlg"];
    [encoder encodeObject:paperCode forKey:@"paperCode"];
    [encoder encodeObject:paperPassWord forKey:@"paperPassWord"];
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.answerName = [decoder decodeObjectForKey:@"answerName"];
        self.questionID =[decoder decodeIntegerForKey:@"questionID"];
        self.seq = [decoder decodeIntegerForKey:@"seq"];
        self.randomID =[decoder decodeIntegerForKey:@"randomID"];
        self.answerID = [decoder decodeIntegerForKey:@"answerID"];
        self.answerFlg =(BOOL) [decoder decodeBoolForKey:@"answerFlg"];
        self.paperCode = [decoder decodeObjectForKey:@"paperCode"];
        self.paperPassWord = [decoder decodeObjectForKey:@"paperPassWord"];
        
        
    }
    return  self;
}


@end
