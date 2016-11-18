//
//  EMoney.h
//  eCampus
//
//  Created by liujianx on 15/9/1.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMoney : NSObject


@property (nonatomic,copy) NSString *pPaySalary;
@property (nonatomic,copy) NSString *TotalSalary;
@property (nonatomic,copy) NSString *sBasicSalary;
@property (nonatomic,copy) NSString *ShouldHousing;
@property (nonatomic,copy) NSString *pBonus;
@property (nonatomic,copy) NSString *pOther;
@property (nonatomic,copy) NSString *sSatOvertime;
@property (nonatomic,copy) NSString *pSatOvertime;
@property (nonatomic,copy) NSString *sPhone;
@property (nonatomic,copy) NSString *pPhone;
@property (nonatomic,copy) NSString *sFloatSalary;
@property (nonatomic,copy) NSString *pFloatSalary;
@property (nonatomic,copy) NSString *PostionAllowance;
@property (nonatomic,copy) NSString *pPostionAllowance;
@property (nonatomic,copy) NSString *pHousing;
@property (nonatomic,copy) NSString *pOvertimeSalary;
@property (nonatomic,copy) NSString *pLate;
@property (nonatomic,copy) NSString *pFund;
@property (nonatomic,copy) NSString *pSocialSecurity;
@property (nonatomic,copy) NSString *pSocialSecurityBasic;
@property (nonatomic,copy) NSString *sf_7;
@property (nonatomic,copy) NSString *sf_6;
@property (nonatomic,copy) NSString *LateTime;
@property (nonatomic,copy) NSString *Vacation;
@property (nonatomic,copy) NSString *NoWork;
@property (nonatomic,copy) NSString *pOverTime1;
@property (nonatomic,copy) NSString *pOverTime2;
@property (nonatomic,copy) NSString *pOverTime3;
@property (nonatomic,copy) NSString *pLeaveSalary;
@property (nonatomic,copy) NSString *pNoWork1;
@property (nonatomic,copy) NSString *pNoWork2;
@property (nonatomic,copy) NSString *pAttendance1;
@property (nonatomic,copy) NSString *pAttendance2;
@property (nonatomic,copy) NSString *pAttendance3;


-(EMoney *)initWithTitle :(NSString *)pPaySalary
              TotalSalary:(NSString *)TotalSalary
             sBasicSalary:(NSString *)sBasicSalary
            ShouldHousing:(NSString *)ShouldHousing
                   pBonus:(NSString *)pBonus
                   pOther:(NSString *)pOther
             sSatOvertime:(NSString *)sSatOvertime
             pSatOvertime:(NSString *)pSatOvertime
                   sPhone:(NSString *)sPhone
                   pPhone:(NSString *)pPhone
             sFloatSalary:(NSString *)sFloatSalary
             pFloatSalary:(NSString *)pFloatSalary
         PostionAllowance:(NSString *)PostionAllowance
        pPostionAllowance:(NSString *)pPostionAllowance
                 pHousing:(NSString *)pHousing
          pOvertimeSalary:(NSString *)pOvertimeSalary
                    pLate:(NSString *)pLate
                    pFund:(NSString *)pFund
          pSocialSecurity:(NSString *)pSocialSecurity
     pSocialSecurityBasic:(NSString *)pSocialSecurityBasic
                     sf_7:(NSString *)sf_7
                     sf_6:(NSString *)sf_6
                 LateTime:(NSString *)LateTime
                 Vacation:(NSString *)Vacation
                   NoWork:(NSString *)NoWork
               pOverTime1:(NSString *)pOverTime1
               pOverTime2:(NSString *)pOverTime2
               pOverTime3:(NSString *)pOverTime3
             pLeaveSalary:(NSString *)pLeaveSalary
                 pNoWork1:(NSString *)pNoWork1
                 pNoWork2:(NSString *)pNoWork2
             pAttendance1:(NSString *)pAttendance1
             pAttendance2:(NSString *)pAttendance2
             pAttendance3:(NSString *)pAttendance3;



@end
