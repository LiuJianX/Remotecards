//
//  JobViewController.m
//  eCampus
//
//  Created by liujianx on 15/8/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "AdjustSalaryController.h"
#import "Common.h"
#import "AdjustSalaryCell.h" 
#import "UIImage+WB.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "MobClick.h"
#import "AdjustSalary.h"

#import <CommonCrypto/CommonCryptor.h>

@interface AdjustSalaryController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *tableViewJob;
    NSMutableArray *mtJob;
    NSArray *arrSelctedJob;
    NSString *jobName,*year,*month;
    UITableViewHeaderFooterView *header;
}

@end

@implementation AdjustSalaryController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)initView{
    
    studented = [Utils loadCustomObjectWithKey:LoginKey];
    
    
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(backButtonData:)];
    [backButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"查询"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self action:@selector(showCalendar)];
    
    [ rightButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    mtJob = [[NSMutableArray alloc]init];
    
    tableViewJob = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [Utils getScreenWidth], [Utils getScreenHeight] )  style: UITableViewStyleGrouped];
    
    tableViewJob.backgroundColor = KLCollectionBkgCollor;
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    tableViewJob.dataSource=self;
    //设置代理
    tableViewJob.delegate=self;
    
    tableViewJob.rowHeight = 250;
    
    [self.view addSubview:tableViewJob];
    
    
    jobName = @"我的调薪单";
    
    [self getJobData];
    
}


-(void)showCalendar{
    
    [self getJobData];
    
    
}



- (void)backButtonData:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return jobName;
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
    @try{
        view.tintColor = NavFontColor;
        
        header = (UITableViewHeaderFooterView *)view;
        [header.textLabel setTextColor:NavFontColor];
        header.textLabel.font = HYQIHEISIZE(18);
        header.textLabel.text = jobName;
        
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 35;
    
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    @try{
        NSString *identifierCell = @"AdjustSalaryCellIdentifier";
        AdjustSalaryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
        
        
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AdjustSalaryCell" owner:self options:nil] lastObject];
            
        }
        
        AdjustSalary *model = [mtJob objectAtIndex:indexPath.row];
        if (model != nil) {
            [cell setSalaryData:model];

        }
        
        
        
        return cell;
        
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }
    
}
#pragma mark - 数据源方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当手指离开某行时，就让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return mtJob.count;
    
}


- (void)getJobData{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"获取数据中,请稍候...";
    
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/GetAdjustSalary"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestNews setPostValue: studented.employee_ID forKey:@"userId"];
    
    [requestNews setDelegate:self];
    
    [requestNews setDidFailSelector:@selector(requestFailed:)];
    
    [requestNews setDidFinishSelector:@selector(requestJobDidSuccess:)];
    
    [requestNews setTimeOutSeconds:timeOut];
    
    [requestNews startSynchronous];
    
    
}

- (void)requestJobDidSuccess:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    @try{
        if (request.responseStatusCode == 200) {
            
            mtJob = [[NSMutableArray alloc]init];
            
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            NSString *err = [responseDict objectForKey:@"errMsg"];
            if (![err isEqualToString:@""]) {
                [Utils showAllTextDialog: err];
                return;
            }
            
            id  key = [responseDict objectForKey:@"list"];
            
            if ((NSNull *)[key objectForKey:@"ADate"] == [NSNull null]){
                
                jobName = @"未找到调薪单!";
                return;
            }
            jobName = [NSString stringWithFormat:@"%@,你在%@有%@调薪单",studented.name,[key objectForKey:@"ADate"],[key objectForKey:@"AType"]];
            
            AdjustSalary *model = [[AdjustSalary alloc] init];
            if ((NSNull *)[key objectForKey:@"Position"] != [NSNull null])
                model.Position = [key objectForKey:@"Position"] ;
            if ((NSNull *)[key objectForKey:@"APosition"] != [NSNull null])
                model.APosition = [key objectForKey:@"APosition"] ;
            if ((NSNull *)[key objectForKey:@"sBasicSalary"] != [NSNull null])
                model.sBasicSalary = [self getDecrypt:[key objectForKey:@"sBasicSalary"]];
            if ((NSNull *)[key objectForKey:@"ABasicSalary"] != [NSNull null])
                model.ABasicSalary = [self getDecrypt:[key objectForKey:@"ABasicSalary"]] ;
            if ((NSNull *)[key objectForKey:@"sBonus"] != [NSNull null])
                model.sBonus = [self getDecrypt:[key objectForKey:@"sBonus"]] ;
            if ((NSNull *)[key objectForKey:@"ABonus"] != [NSNull null])
                model.ABonus = [self getDecrypt:[key objectForKey:@"ABonus"]] ;
            if ((NSNull *)[key objectForKey:@"sSatOvertime"] != [NSNull null]) model.sSatOvertime = [self getDecrypt:[key objectForKey:@"sSatOvertime"]] ;
            if ((NSNull *)[key objectForKey:@"ASatOvertime"] != [NSNull null]) model.ASatOvertime = [self getDecrypt:[key objectForKey:@"ASatOvertime"]] ;
            if ((NSNull *)[key objectForKey:@"sPhone"] != [NSNull null]) model.sPhone = [self getDecrypt:[key objectForKey:@"sPhone"]] ;
            if ((NSNull *)[key objectForKey:@"APhone"] != [NSNull null]) model.APhone = [self getDecrypt:[key objectForKey:@"APhone"]] ;
            if ((NSNull *)[key objectForKey:@"sFloatSalary"] != [NSNull null]) model.sFloatSalary = [self getDecrypt:[key objectForKey:@"sFloatSalary"]] ;
            if ((NSNull *)[key objectForKey:@"AFloatSalary"] != [NSNull null]) model.AFloatSalary = [self getDecrypt:[key objectForKey:@"AFloatSalary"]] ;
            if ((NSNull *)[key objectForKey:@"PostionAllowance"] != [NSNull null])
                model.PostionAllowance = [self getDecrypt:[key objectForKey:@"PostionAllowance"]] ;
            if ((NSNull *)[key objectForKey:@"ShouldHousing"] != [NSNull null]) model.ShouldHousing = [self getDecrypt:[key objectForKey:@"ShouldHousing"]] ;
            if ((NSNull *)[key objectForKey:@"AShouldHousing"] != [NSNull null]) model.AShouldHousing = [self getDecrypt:[key objectForKey:@"AShouldHousing"]] ;
            if ((NSNull *)[key objectForKey:@"APostionAllowance"] != [NSNull null])
                model.APostionAllowance = [self getDecrypt:[key objectForKey:@"APostionAllowance"] ];
            if ((NSNull *)[key objectForKey:@"TotalSalary"] != [NSNull null])
                model.TotalSalary = [self getDecrypt:[key objectForKey:@"TotalSalary"]] ;
            if ((NSNull *)[key objectForKey:@"ATotalSalary"] != [NSNull null])
                model.ATotalSalary = [self getDecrypt:[key objectForKey:@"ATotalSalary"]] ;
            
            if ((NSNull *)[key objectForKey:@"AAttendancaBonus"] != [NSNull null])
                model.AAttendancaBonus = [self getDecrypt:[key objectForKey:@"AAttendancaBonus"]] ;
            if ((NSNull *)[key objectForKey:@"AttendancaBonus"] != [NSNull null])
                model.AttendancaBonus = [self getDecrypt:[key objectForKey:@"AttendancaBonus"]] ;
            
            [mtJob addObject:model];
            
            [tableViewJob reloadData];
            
            
        } else {
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
    
}

-(NSString *)getDecrypt:(NSString *)str{
    
    return  [Utils encryptWithContent:str type:kCCDecrypt key:@"supercom"];
    
}


- (void)requestFailed:(ASIHTTPRequest *)request{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [ Utils showAllTextDialog:@"网络超时,请稍后再试!"];
    
}

@end
