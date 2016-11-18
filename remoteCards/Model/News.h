//
//  News.h
//  eCampus
//
//  Created by liujianx on 15/8/6.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsAnswer.h"

@interface News : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *titleDetail;

@property (nonatomic,copy) NSString *contextDetail;

@property (nonatomic,copy) NSString *createTime;

@property (nonatomic,copy) NSString *titleImage;

@property (nonatomic, assign) NSInteger newID;

@property (nonatomic,copy) NSString *questionID;


@property (nonatomic,copy) NSString *type ;

@property (nonatomic,assign) BOOL isAnswer;

@property (nonatomic,assign) BOOL isLocal;


-(News *)initWithTitle :(NSString *)title titleDetail:(NSString *)titleDetail contextDetail:(NSString *)contextDetail createTime:(NSString *)createTime titleImage:(NSString *)titleImage newID:(NSInteger) newID questionID:(NSString *)questionID;



@end
