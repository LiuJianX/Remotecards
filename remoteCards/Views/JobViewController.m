//
//  JobViewController.m
//  eCampus
//
//  Created by liujianx on 15/8/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "JobViewController.h"
#import "Common.h"
#import "HomeNewCell.h"
#import "Jobs.h"
#import "UIImage+WB.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "MobClick.h"

@interface JobViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
    
    UITableView *tableViewJob;
    NSMutableArray *mtJob;
    NSArray *arrSelctedJob;
    NSString *jobName,*year,*month;
    UITableViewHeaderFooterView *header;
    
  
}
 
@end

@implementation JobViewController

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
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"                                                                   style:UIBarButtonItemStylePlain
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
    
//    Jobs *m = [[Jobs alloc] init];
//    [mtJob addObject:m];
//    
//    m = [[Jobs alloc] init];
//    [mtJob addObject:m];
//    
    tableViewJob = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [Utils getScreenWidth], [Utils getScreenHeight] )  style: UITableViewStyleGrouped];
    
    tableViewJob.backgroundColor = KLCollectionBkgCollor;
   
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    tableViewJob.dataSource=self;
    //设置代理
    tableViewJob.delegate=self;
    
    tableViewJob.rowHeight = 240;
    
    
    [self.view addSubview:tableViewJob];
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY"];
    year = [dateFormatter stringFromDate:currentDate];
    [dateFormatter setDateFormat:@"M"];
    
    month = [dateFormatter stringFromDate:currentDate];
    if ([month isEqualToString:@"0"]){
        month = @"1";
    }
        
    jobName = [NSString stringWithFormat:@"%@ 考勤月份：%@年%@月",studented.name,year,month];
    
    
    [self getJobData:year month:month];
    
    
// 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
//    tableViewJob.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self getJobData];
//    }];
    
    // 马上进入刷新状态
    //[tableViewJob.header beginRefreshing];
    
    
    
//    tabBarProfile = [[UITabBar alloc]initWithFrame:CGRectMake(0,[Utils getScreenHeight]  - tabHeight, [Utils getScreenWidth],49) ] ;
//    
//    tabBarProfile.delegate = self;
//    tabBarProfile.backgroundColor = KLCollectionBkgCollor;
//    
//    [self.view addSubview:tabBarProfile];
//
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

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifierCell = @"JobIdentifier";
    HomeNewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
     
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeNewCell" owner:self options:nil] lastObject];
        
       // cell = [[[NSBundle mainBundle] loadNibNamed:@"JobApplyCell" owner:self options:nil] lastObject];
        
    }else{
//        // 删除cell中的子对象,刷新覆盖问题。
//        while ([cell.contentView.subviews lastObject] != nil) {
//            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
//        }
    
    }
    // cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Jobs *model = [mtJob objectAtIndex:indexPath.row];
    
    [cell setNewsData:model];
    
    
    
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


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return jobName;
    
}


- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = NavFontColor;
    
    header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:NavFontColor];
    header.textLabel.font = HYQIHEISIZE(20);
    header.textLabel.text = jobName;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return mtJob.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 35;
    
}

- (void)getJobData:(NSString *)mYear month:(NSString *)mMonth{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"获取数据中,请稍候...";
   
    
        NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/GetCardRerodData"]];
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
            
            responseDict = [responseDict objectForKey:@"list"];
            
            for (id key in responseDict) {
                Jobs *model = [[Jobs alloc] init];
                model.weekDate = [key objectForKey:@"WeekDate"] ;
                model.tDate = [key objectForKey:@"tDate"] ;
                model.emp_ID = [key objectForKey:@"Emp_ID"] ;
                model.workIn1 = [key objectForKey:@"WorkIn1"] ;
                model.workIn2 = [key objectForKey:@"WorkIn2"] ;
                model.workOut1 = [key objectForKey:@"WorkOut1"] ;
                model.workOut2 = [key objectForKey:@"WorkOut2"] ;
                model.otIn1 = [key objectForKey:@"OtIn1"] ;
                model.otOut1 = [key objectForKey:@"OtOut1"] ;
                
                model.otIn2 = [key objectForKey:@"OtIn2"] ;
                model.otOut2 = [key objectForKey:@"OtOut2"] ;
                
                
                model.leave = [key objectForKey:@"Leave"] ;
                model.ot = [key objectForKey:@"ot"] ;;
                model.late = [key objectForKey:@"Late"] ;
                model.noWork = [key objectForKey:@"NoWork"] ;
                model.noCard = [key objectForKey:@"NoCard"] ;
                model.vacation = [key objectForKey:@"Vacation"] ;
                model.workHour = [key objectForKey:@"WorkHour"] ;
                model.restHour = [key objectForKey:@"RestHour"] ;
                model.workType = [key objectForKey:@"WorkType"] ;
                model.workDays = [key objectForKey:@"WorkDays"] ;
                model.vac = [key objectForKey:@"Vac"] ;
                model.remark = [key objectForKey:@"Remark"] ;
                model.rplDirect = [key objectForKey:@"RplDirect"] ;
                model.rplHour = [key objectForKey:@"RplHour"] ;
                model.kResult = [key objectForKey:@"kResult"] ;
                model.name = [key objectForKey:@"Name"] ;
                model.departName = [key objectForKey:@"DepartName"] ;
                model.duty = [key objectForKey:@"Duty"] ;
                model.position = [key objectForKey:@"Position"] ;
                [mtJob addObject:model];
                
            }
            
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
        NSString *str = [NSString stringWithFormat:@".....:%@",timestamp];
        
        NSLog(@"%@", str);
        
        
    }
    
}



@end
