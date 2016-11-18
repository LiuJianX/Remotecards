//
//  RegisterData.h
//  eCampus
//
//  Created by liujianx on 15/8/20.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterData : NSObject

@property(nonatomic,strong) NSString *regKey;

@property(nonatomic,strong) NSString *regPlaceholder;

@property(nonatomic,strong) NSString *regImage;

@property(nonatomic,strong) NSString *regValue;
 
@property(nonatomic,assign) NSInteger rowIndex;

@property(nonatomic,assign) NSInteger rowSection;

@property(nonatomic,assign) NSInteger regType;

@property(nonatomic,strong) NSString* regTip;
@end
