//
//  EMoney.m
//  eCampus
//
//  Created by liujianx on 15/9/1.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "EMoney.h"

@implementation EMoney

-(EMoney *)initWithTitle :(NSString *)pPaySalary
              TotalSalary:(NSString *)TotalSalary

             sBasicSalary:(NSString *)sBasicSalary
             pBasicSalary:(NSString *)pBasicSalary
            ShouldHousing:(NSString *)ShouldHousing
                   pBonus:(NSString *)pBonus
                   sBonus:(NSString *)sBonus

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
             pAttendance3:(NSString *)pAttendance3
              pCashSalary:(NSString *)pCashSalary
          AttendancaBonus:(NSString *)AttendancaBonus
          AAttendancaBonus:(NSString *)AAttendancaBonus
{
    if(self = [super init]){
        
        self.pPaySalary = pPaySalary;
        self.TotalSalary = TotalSalary;
        self.sBasicSalary = sBasicSalary;
        self.pBasicSalary = pBasicSalary;
        self.sBonus = sBonus;
        self.ShouldHousing = ShouldHousing;
        self.pBonus = pBonus;
        self.pOther = pOther;
        self.sSatOvertime = sSatOvertime;
        self.pSatOvertime = pSatOvertime;
        self.sPhone = sPhone;
        self.pPhone = pPhone;
        self.sFloatSalary = sFloatSalary;
        self.pFloatSalary = pFloatSalary;
        self.PostionAllowance = PostionAllowance;
        self.pPostionAllowance = pPostionAllowance;
        self.pHousing = pHousing;
        self.pOvertimeSalary = pOvertimeSalary;
        self.pLate = pLate;
        self.pFund = pFund;
        self.pSocialSecurity = pSocialSecurity;
        self.pSocialSecurityBasic = pSocialSecurityBasic;
        self.sf_7 = sf_7;
        self.sf_6 = sf_6;
        self.LateTime = LateTime;
        self.Vacation = Vacation;
        self.NoWork = NoWork;
        self.pOverTime1 = pOverTime1;
        self.pCashSalary = pCashSalary;
        self.pOverTime2 = pOverTime2;
        self.pOverTime3 = pOverTime3;
        self.pLeaveSalary = pLeaveSalary;
        self.pNoWork1 = pNoWork1;
        self.pNoWork2 = pNoWork2;
        self.pAttendance1 = pAttendance1;
        self.pAttendance2 = pAttendance2;
        self.pAttendance3 = pAttendance3;
        self.AttendancaBonus = AttendancaBonus;
        self.AAttendancaBonus = AAttendancaBonus;
        
    }
    return self;
    
}
@end
