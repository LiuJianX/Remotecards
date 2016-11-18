//
//  News.m
//  eCampus
//
//  Created by liujianx on 15/8/6.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "News.h"

@implementation News
 
-(News *)initWithTitle :(NSString *)title titleDetail:(NSString *)titleDetail contextDetail:(NSString *)contextDetail createTime:(NSString *)createTime titleImage:(NSString *)titleImage newID:(NSInteger) newID questionID:(NSString *)questionID{
   
    if(self=[super init]){
        
        self.title = title;
        self.titleDetail = titleDetail;
        self.contextDetail = contextDetail;
        self.createTime = createTime;
        self.titleImage = titleImage;
        self.newID = newID;
        self.questionID = questionID;
       // self.newsAnswer = newsAnswer;
        
    }
    return self;
}






@end
