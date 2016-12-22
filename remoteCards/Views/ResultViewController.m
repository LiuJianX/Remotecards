//
//  JobViewController.m
//  eCampus
//
//  Created by liujianx on 15/8/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "ResultViewController.h"
#import "Common.h"
#import "KaoQinResultCell.h"
#import "Jobs.h"
#import "UIImage+WB.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "MobClick.h"  
#import "Interview.h"
#import "News.h"

@interface ResultViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
    
    UITableView *tableViewJob;
    NSMutableArray *mtJob;
    NSArray *arrSelctedJob;
    NSString *jobName,*year,*month;
    UITableViewHeaderFooterView *header;
}
 
@end

@implementation ResultViewController


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
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY"];
    year = [dateFormatter stringFromDate:currentDate];
    [dateFormatter setDateFormat:@"M"];
    
    month = [dateFormatter stringFromDate:currentDate];
    
   jobName = [NSString stringWithFormat:@"%@ 考勤日期：%@年%@月",studented.name,year,month];
    
    [self getJobData:year month:month];
    
}


-(void)showCalendar{
  
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM"];

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
  
        jobName = [NSString stringWithFormat:@"%@ 考勤月份：%@年%@月",studented.name,year,month];
        
      
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
    header.textLabel.font = HYQIHEISIZE(20);
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
    NSString *identifierCell = @"KaoQinResultCellIdentifier";
    KaoQinResultCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
     
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"KaoQinResultCell" owner:self options:nil] lastObject];
        
        
    }
    
    Interview *model = [mtJob objectAtIndex:indexPath.row];
    
   [cell setData:model];
    
    
    
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


- (void)getJobData:(NSString *)mYear month:(NSString *)mMonth{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"获取数据中,请稍候...";
    
        NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/GetMonthCardRerodData"]];
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
            
         
                Interview *model = [[Interview alloc] init];
            
                  if ((NSNull *)[key objectForKey:@"WorkDays"] != [NSNull null])
                      model.workDays = [key objectForKey:@"WorkDays"] ;
            if ((NSNull *)[key objectForKey:@"WorkHours"] != [NSNull null])

                model.workHours = [key objectForKey:@"WorkHours"] ;
            if ((NSNull *)[key objectForKey:@"Vacation"] != [NSNull null])
                model.vacation = [key objectForKey:@"Vacation"] ;
            if ((NSNull *)[key objectForKey:@"VacSlr"] != [NSNull null])
                model.vacSlr = [key objectForKey:@"VacSlr"] ;
            if ((NSNull *)[key objectForKey:@"OtTime"] != [NSNull null])
                model.otTime = [key objectForKey:@"OtTime"] ;
               if ((NSNull *)[key objectForKey:@"OriOT"] != [NSNull null])
                   model.oriOT = [key objectForKey:@"OriOT"] ;
              if ((NSNull *)[key objectForKey:@"VacOT"] != [NSNull null]) model.vacOT = [key objectForKey:@"VacOT"] ;
               if ((NSNull *)[key objectForKey:@"LegOT"] != [NSNull null]) model.legOT = [key objectForKey:@"LegOT"] ;
               if ((NSNull *)[key objectForKey:@"NightCount"] != [NSNull null]) model.nightCount = [key objectForKey:@"NightCount"] ;
               if ((NSNull *)[key objectForKey:@"RestTime"] != [NSNull null]) model.restTime = [key objectForKey:@"RestTime"] ;
               if ((NSNull *)[key objectForKey:@"Late"] != [NSNull null]) model.late = [key objectForKey:@"Late"] ;
               if ((NSNull *)[key objectForKey:@"LateTime"] != [NSNull null]) model.lateTime = [key objectForKey:@"LateTime"] ;
               if ((NSNull *)[key objectForKey:@"Leave"] != [NSNull null]) model.leave = [key objectForKey:@"Leave"] ;
               if ((NSNull *)[key objectForKey:@"NoCard"] != [NSNull null]) model.noCard = [key objectForKey:@"NoCard"] ;
               if ((NSNull *)[key objectForKey:@"NoWork"] != [NSNull null])  model.noWork = [key objectForKey:@"NoWork"] ;
               if ((NSNull *)[key objectForKey:@"LeaveTime"] != [NSNull null]) model.leaveTime = [key objectForKey:@"LeaveTime"] ;
               if ((NSNull *)[key objectForKey:@"sLeaveTime"] != [NSNull null]) model.sleaveTime = [key objectForKey:@"sLeaveTime"] ;
            
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
- (void)requestFailed:(ASIHTTPRequest *)request{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [ Utils showAllTextDialog:@"网络超时,请稍后再试!"];
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        UIDatePicker *datePicker0= (UIDatePicker *)[actionSheet viewWithTag:101];
        NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM";
        
        NSString *timestamp = [formatter stringFromDate:datePicker0.date];
    //    NSString *str = [NSString stringWithFormat:@".....:%@",timestamp];
        
      //  NSLog(@"%@", str);
        
        
    }
    
}



@end
