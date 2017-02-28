//
//  Interview.h
//  eCampus
//
//  Created by liujianx on 15/9/4.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdjustSalary : NSObject

@property (nonatomic,copy) NSString *Position;
@property (nonatomic,copy) NSString *APosition;
@property (nonatomic,copy) NSString *sBasicSalary;
@property (nonatomic,copy) NSString *ABasicSalary;
@property (nonatomic,copy) NSString *sBonus;
@property (nonatomic,copy) NSString *ABonus;
@property (nonatomic,copy) NSString *sSatOvertime;
@property (nonatomic,copy) NSString *ASatOvertime;
@property (nonatomic,copy) NSString *sPhone;
@property (nonatomic,copy) NSString *APhone;
@property (nonatomic,copy) NSString *sFloatSalary;
@property (nonatomic,copy) NSString *AFloatSalary;
@property (nonatomic,copy) NSString *PostionAllowance;
@property (nonatomic,copy) NSString *APostionAllowance;
@property (nonatomic,copy) NSString *ShouldHousing;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *AShouldHousing;
@property (nonatomic,copy) NSString *TotalSalary;
@property (nonatomic,copy) NSString *ATotalSalary;

-(AdjustSalary *)initWithTitle :(NSString *)Position
                   APosition:(NSString *)APosition
                    sBasicSalary:(NSString *)sBasicSalary
                      ABasicSalary:(NSString *)ABasicSalary
                      sBonus:(NSString *)sBonus
                       ABonus:(NSString *)ABonus
                       sSatOvertime:(NSString *)sSatOvertime
                       ASatOvertime:(NSString *)ASatOvertime
                  sPhone:(NSString *)sPhone
                    APhone:(NSString *)APhone
                        sFloatSalary:(NSString *)sFloatSalary
                    AFloatSalary:(NSString *)AFloatSalary
                       PostionAllowance:(NSString *)PostionAllowance
                      APostionAllowance:(NSString *)APostionAllowance
                       title:(NSString *)title
                   ShouldHousing:(NSString *)ShouldHousing
                   AShouldHousing:(NSString *)AShouldHousing
                    TotalSalary:(NSString *)TotalSalary
                    ATotalSalary:(NSString *)ATotalSalary;


@end
