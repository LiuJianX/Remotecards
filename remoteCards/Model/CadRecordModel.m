//
//  CadRecordModel.m
//  remoteCards
//
//  Created by liujianxiong on 2017/6/24.
//  Copyright © 2017年 esquel. All rights reserved.
//

#import "CadRecordModel.h"

@implementation CadRecordModel

-(CadRecordModel *)initWithTitle :(NSString *)cardDate
                   cardType:(NSString *)cardType
                    msg:(NSString *)msg {
    
    if(self = [super init]){
        
        self.cardDate = cardDate;
        self.cardType = cardType;
        self.msg = msg;
        
    }
    return self;
}


@end
