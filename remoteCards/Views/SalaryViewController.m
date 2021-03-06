//
//  JobViewController.m
//  eCampus
//
//  Created by liujianx on 15/8/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "SalaryViewController.h"
#import "Common.h"
#import "ProfileSalaryCell.h"
#import "EMoney.h"
#import "UIImage+WB.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "MobClick.h"
#import <CommonCrypto/CommonCryptor.h>


@interface SalaryViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
    
    UITableView *tableViewJob;
    NSMutableArray *mtJob;
    NSArray *arrSelctedJob;
    NSString *jobName,*year,*month;
    UITableViewHeaderFooterView *header;
}

@end

@implementation SalaryViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"PageRequstJob"];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"PageRequstJob"];
}

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
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(backButtonData:)];
    [backButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"查询"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self action:@selector(showCalendar)];
    
    [ rightButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    
    //    if(is4Inch){
    //        tabHeight = 49;
    //    }
    
    mtJob = [[NSMutableArray alloc]init];
         //
    tableViewJob = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [Utils getScreenWidth], [Utils getScreenHeight] )  style: UITableViewStyleGrouped];
    
    tableViewJob.backgroundColor = KLCollectionBkgCollor;
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    tableViewJob.dataSource=self;
    //设置代理
    tableViewJob.delegate=self;
    
    tableViewJob.rowHeight = 500;
    
    
    [self.view addSubview:tableViewJob];
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY"];
    year = [dateFormatter stringFromDate:currentDate];
    [dateFormatter setDateFormat:@"M"];
    
    month = [dateFormatter stringFromDate:currentDate];
    
    if([month integerValue] <= 22){
        NSInteger tempMonth = [month integerValue] - 1 ;
        
        month = [NSString stringWithFormat:@"%ld",(long)tempMonth];
    }
    
    if ([month isEqualToString:@"0"]){
        month = @"1";
    }

    
    [self getJobData:year month:month];
    
    
}


-(void)showCalendar{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-M"];
    
    NSDate *strDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@-%@",year,month]];
    
    [datePicker  setDate:strDate];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert.view addSubview:datePicker];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        
        //实例化一个NSDateFormatter对象
        
        [dateFormat setDateFormat:@"yyyy"];//设定时间格式
        
        year = [dateFormat stringFromDate:datePicker.date];
        
        //求出当天的时间字符串
        [dateFormat setDateFormat:@"M"];//设定时间格式
        
        month = [dateFormat stringFromDate:datePicker.date];
        
        [self getJobData:year month:month];
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    
    [alert addAction:ok];
    
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:^{ }];
    
    
}



- (void)backButtonData:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifierCell = @"ProfileSalaryCellIdentifier";
    ProfileSalaryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
    
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProfileSalaryCell" owner:self options:nil] lastObject];
   
    }
    
    EMoney *model = [mtJob objectAtIndex:indexPath.row];
    
    [cell setData:model];
    
    return cell;
    
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

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return jobName;
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = NavFontColor;
    
    header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:NavFontColor];
    header.textLabel.font = HYQIHEISIZE(16);
    header.textLabel.text = jobName;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 35;
    
}



- (void)getJobData:(NSString *)mYear month:(NSString *)mMonth{
    
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/GetSalaryData"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestNews setPostValue: studented.employee_ID forKey:@"userId"];
    [requestNews setPostValue: mYear forKey:@"year"];
    [requestNews setPostValue: mMonth forKey:@"month"];
    
    [requestNews setDelegate:self];
    
    [requestNews setDidFailSelector:@selector(requestFailed:)];
    
    [requestNews setDidFinishSelector:@selector(requestJobDidSuccess:)];
    
    [requestNews setTimeOutSeconds:timeOut];
    
    [requestNews startSynchronous];
    
    
}

- (void)requestJobDidSuccess:(ASIHTTPRequest *)request
{
    // [MBProgressHUD hideHUDForView:self.view animated:YES];
    
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
            
            id key = [responseDict objectForKey:@"list"];
            
            NSString *str = [key objectForKey:@"pScore"] ;
            if ((NSNull *)[key objectForKey:@"pScore"]  == [NSNull null]
                || [str isEqualToString:@""]) {
                jobName = [NSString stringWithFormat:@"未找到%@年%@月的工资条",year,month];
                header.textLabel.text = jobName;
                return;
            
            }
            
            EMoney *model = [[EMoney alloc] init];
            if ((NSNull *)[key objectForKey:@"pPaySalary"]  != [NSNull null])
                model.pPaySalary = [self getDecrypt:[key objectForKey:@"pPaySalary"]];
            
            if ((NSNull *)[key objectForKey:@"TotalSalary"]  != [NSNull null])
                model.TotalSalary = [self getDecrypt:[key objectForKey:@"TotalSalary"]];
            
            if ((NSNull *)[key objectForKey:@"sBasicSalary"]  != [NSNull null])
            model.sBasicSalary = [self getDecrypt:[key objectForKey:@"sBasicSalary"]];
            if ((NSNull *)[key objectForKey:@"pBasicSalary"]  != [NSNull null])
            model.pBasicSalary = [self getDecrypt:[key objectForKey:@"pBasicSalary"]];
            if ((NSNull *)[key objectForKey:@"sBonus"]  != [NSNull null])
            model.sBonus = [self getDecrypt:[key objectForKey:@"sBonus"]];
            if ((NSNull *)[key objectForKey:@"ShouldHousing"]  != [NSNull null])
            model.ShouldHousing = [self getDecrypt:[key objectForKey:@"ShouldHousing"]];
            if ((NSNull *)[key objectForKey:@"pBonus"]  != [NSNull null])
            model.pBonus = [self getDecrypt:[key objectForKey:@"pBonus"]];
            if ((NSNull *)[key objectForKey:@"pOther"]  != [NSNull null])
            model.pOther =   [self getDecrypt:[key objectForKey:@"pOther"]];
            if ((NSNull *)[key objectForKey:@"sSatOvertime"]  != [NSNull null])
            model.sSatOvertime = [self getDecrypt:[key objectForKey:@"sSatOvertime"]];
            if ((NSNull *)[key objectForKey:@"pSatOvertime"]  != [NSNull null])
            model.pSatOvertime =  [self getDecrypt:[key objectForKey:@"pSatOvertime"]];
            if ((NSNull *)[key objectForKey:@"sPhone"]  != [NSNull null])
            model.sPhone =  [self getDecrypt:[key objectForKey:@"sPhone"]];
            if ((NSNull *)[key objectForKey:@"pPhone"]  != [NSNull null])
            model.pPhone =  [self getDecrypt:[key objectForKey:@"pPhone"]];
            if ((NSNull *)[key objectForKey:@"sFloatSalary"]  != [NSNull null])
                model.sFloatSalary =   [self getDecrypt:[key objectForKey:@"sFloatSalary"]];
            model.pFloatSalary =   [self getDecrypt:[key objectForKey:@"pFloatSalary"]];
            if ((NSNull *)[key objectForKey:@"PostionAllowance"]  != [NSNull null])
                model.PostionAllowance = [self getDecrypt:[key objectForKey:@"PostionAllowance"]];
            model.pPostionAllowance = [self getDecrypt:[key objectForKey:@"pPostionAllowance"]];
            if ((NSNull *)[key objectForKey:@"pHousing"]  != [NSNull null])
                model.pHousing = [self getDecrypt:[key objectForKey:@"pHousing"]];
            model.pOvertimeSalary = [self getDecrypt:[key objectForKey:@"pOvertimeSalary"]];
            if ((NSNull *)[key objectForKey:@"pLate"]  != [NSNull null])
                model.pLate = [self getDecrypt:[key objectForKey:@"pLate"]];
            model.pFund = [self getDecrypt:[key objectForKey:@"pFund"]];
            if ((NSNull *)[key objectForKey:@"pSocialSecurity"]  != [NSNull null])
                model.pSocialSecurity = [self getDecrypt:[key objectForKey:@"pSocialSecurity"]];
            model.pSocialSecurityBasic =[self getDecrypt:[key objectForKey:@"pSocialSecurityBasic"]] ;
            if ((NSNull *)[key objectForKey:@"pCashSalary"]  != [NSNull null])
                 model.pCashSalary=[self getDecrypt:[key objectForKey:@"pCashSalary"]] ;
            if ((NSNull *)[key objectForKey:@"sf_7"]  != [NSNull null])
                model.sf_7 = [key objectForKey:@"sf_7"];
            if ((NSNull *)[key objectForKey:@"sf_6"]  != [NSNull null])
                model.sf_6 = [key objectForKey:@"sf_6"];
            if ((NSNull *)[key objectForKey:@"LateTime"]  != [NSNull null])
                model.LateTime = [key objectForKey:@"LateTime"];
            if ((NSNull *)[key objectForKey:@"Vacation"]  != [NSNull null])
                model.Vacation = [key objectForKey:@"Vacation"];
            if ((NSNull *)[key objectForKey:@"NoWork"]  != [NSNull null])
                model.NoWork = [key objectForKey:@"NoWork"];
            if ((NSNull *)[key objectForKey:@"pOverTime1"]  != [NSNull null])
            model.pOverTime1 = [key objectForKey:@"pOverTime1"];
            if ((NSNull *)[key objectForKey:@"pOverTime2"]  != [NSNull null])
                model.pOverTime2 = [key objectForKey:@"pOverTime2"];
            if ((NSNull *)[key objectForKey:@"pOverTime3"]  != [NSNull null])
                model.pOverTime3 = [key objectForKey:@"pOverTime3"];
            if ((NSNull *)[key objectForKey:@"pLeaveSalary"]  != [NSNull null])
                model.pLeaveSalary = [key objectForKey:@"pLeaveSalary"];
            if ((NSNull *)[key objectForKey:@"pNoWork1"]  != [NSNull null])model.pNoWork1 = [key objectForKey:@"pNoWork1"];
            if ((NSNull *)[key objectForKey:@"pNoWork2"]  != [NSNull null])model.pNoWork2 = [key objectForKey:@"pNoWork2"];
            if ((NSNull *)[key objectForKey:@"pAttendance1"]  != [NSNull null])model.pAttendance1 =[key objectForKey:@"pAttendance1"] ;
            if ((NSNull *)[key objectForKey:@"pAttendance2"]  != [NSNull null])model.pAttendance2 = [key objectForKey:@"pAttendance2"];
            if ((NSNull *)[key objectForKey:@"pAttendance3"]  != [NSNull null])model.pAttendance3 = [key objectForKey:@"pAttendance3"];
            if ((NSNull *)[key objectForKey:@"AttendanceBonus"]  != [NSNull null])
                    model.AttendancaBonus =   [self getDecrypt:[key objectForKey:@"AttendanceBonus"]];

            
            [mtJob addObject:model];
                
            
            jobName = [NSString stringWithFormat:@"%@ %@年%@月 当月评份： %@", studented.name,year,month,[self getDecrypt:str]];

            
            [tableViewJob reloadData];
            
            
            // 拿到当前的下拉刷新控件，结束刷新状态
            //  [tableViewJob.header endRefreshing];
            
            
            
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
    
    [ Utils showAllTextDialog:@"网络超时,请稍后再试!"];
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        UIDatePicker *datePicker0= (UIDatePicker *)[actionSheet viewWithTag:101];
        NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM";
        
        NSString *timestamp = [formatter stringFromDate:datePicker0.date];
        NSString *str = [NSString stringWithFormat:@".....:%@",timestamp];
        
        NSLog(@"%@", str);
        
        
    }
    
}



@end
