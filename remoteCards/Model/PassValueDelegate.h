//
//  PassValueDelegate.h
//  eCampus
//
//  Created by liujianx on 15/7/24.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StudentMaster;

@protocol PassValueDelegate <NSObject>

-(void)loginPassValue:(StudentMaster *)value;

-(void)callBackWrittingDetail;

@end
