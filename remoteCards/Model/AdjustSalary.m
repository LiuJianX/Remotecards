//
//  Interview.m
//  eCampus
//
//  Created by liujianx on 15/9/4.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "AdjustSalary.h"

@implementation AdjustSalary
 
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
                   ATotalSalary:(NSString *)ATotalSalary {
    
    if(self = [super init]){
        
        self.title = title;
        self.Position = Position;
        self.APosition = APosition;
        self.sBasicSalary = sBasicSalary;
        self.ABasicSalary = ABasicSalary;
        self.sBonus = sBonus;
        self.ABonus = ABonus;
        self.sSatOvertime = sSatOvertime;
        self.ASatOvertime = ASatOvertime;
        self.sPhone = sPhone;
        self.APhone = APhone;
        self.sFloatSalary = sFloatSalary;
        self.AFloatSalary = AFloatSalary;
        self.PostionAllowance = PostionAllowance;
        self.APostionAllowance = APostionAllowance;
        self.ShouldHousing = ShouldHousing;
        self.AShouldHousing = AShouldHousing;
        self.TotalSalary = TotalSalary;
        self.ATotalSalary = ATotalSalary;
        
    }
    return self;
}

@end
