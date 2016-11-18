//
//  ExamResult.h
//  eCampus
//
//  Created by liujianx on 15/7/28.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExamResult : NSObject{
    NSInteger questionID;
    NSInteger seq;
    NSInteger answerID;
    NSInteger randomID;
    NSString  *answerName;
    BOOL  answerFlg;
    NSString *paperCode;
    NSString *paperPassWord;
    
}
@property(nonatomic,retain) NSString *paperCode;
@property (nonatomic,retain) NSString *paperPassWord;
@property(nonatomic,assign)  NSInteger randomID;

@property(nonatomic,assign) NSInteger seq;
/**
 *  问题id
 */
@property(nonatomic,assign) NSInteger questionID;
/**
 *  问题数值
 */
@property(nonatomic,assign) NSInteger answerID;
/**
 *  问题答案选项
 */
@property(nonatomic,retain) NSString *answerName;
/**
 *  问题选项是否有做标记
 */
@property(nonatomic,assign) BOOL answerFlg;


@end
