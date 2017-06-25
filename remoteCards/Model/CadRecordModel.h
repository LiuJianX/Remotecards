//
//  CadRecordModel.h
//  remoteCards
//
//  Created by liujianxiong on 2017/6/24.
//  Copyright © 2017年 esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CadRecordModel : NSObject

@property (nonatomic,copy) NSString *cardDate;
@property (nonatomic,copy) NSString *cardType;
@property (nonatomic,copy) NSString *msg;


-(CadRecordModel *)initWithTitle :(NSString *)cardDate
                   cardType:(NSString *)cardType
                    msg:(NSString *)msg ;


@end
