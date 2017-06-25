//
//  JobViewController.m
//  eCampus
//
//  Created by liujianx on 15/8/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "CardRecordController.h"
#import "Common.h"
#import "CardRecordCell.h"
#import "CadRecordModel.h"
#import "UIImage+WB.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "MobClick.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface CardRecordController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
    
    UITableView *tableViewJob;
    NSMutableArray *mtJob;
    NSArray *arrSelctedJob;
    NSString *jobName,*year,*month;
    UITableViewHeaderFooterView *header;
    
  
}
 
@end

@implementation CardRecordController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"CardRecordController"];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"CardRecordController"];
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
                                                                   target:self action:@selector(showCardQuery)];
    
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
    
    tableViewJob.rowHeight = 40;
    
    
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
        
    jobName = [NSString stringWithFormat:@"%@ 打卡月份：%@年%@月",studented.name,year,month];
    
    
    [self initData:year month:month];
    
}


-(void)showCardQuery{
  
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
       
        jobName = [NSString stringWithFormat:@"%@ 打卡月份：%@年%@月",studented.name,year,month];
        
        
        [self initData:year month:month];
        
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
    
    NSString *identifierCell = @"CardRecordIdentifier";
    CardRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
     
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CardRecordCell" owner:self options:nil] lastObject];
        
       // cell = [[[NSBundle mainBundle] loadNibNamed:@"JobApplyCell" owner:self options:nil] lastObject];
        
    }else{
//        // 删除cell中的子对象,刷新覆盖问题。
//        while ([cell.contentView.subviews lastObject] != nil) {
//            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
//        }
    
    }
    // cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    CadRecordModel *model = [mtJob objectAtIndex:indexPath.row];
    
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


- (void)initData:(NSString *)mYear month:(NSString *)mMonth{
    
   // FMDatabase *db;
    @try{
      
        NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory,NSUserDomainMask, YES);
        NSString *doucmentDirectory = [paths objectAtIndex:0];
        NSString *dbPath = [doucmentDirectory stringByAppendingString:@"remoteCards.db"];
        
        mtJob = [[NSMutableArray alloc]init];

        
        FMDatabaseQueue* queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        
        [queue inDatabase:^(FMDatabase *db){
            
            
            NSString *selCmd = [NSString stringWithFormat:@"select * from CardRecord where userId = \"%@\" and cYear =\"%@\" and cMonth = \"%@\" ",studented.employee_ID ,mYear,mMonth];
            mtJob = [[NSMutableArray alloc]init];
          //  selCmd = @"select * from paperInfo";
            
            FMResultSet * rs = [db executeQuery:selCmd];
            while ([rs next]) {
                NSString *strDate = [rs stringForColumn:@"cardDate"];
                NSString *strMsg = [rs stringForColumn:@"errMsg"];
                NSInteger  cardType =[[rs stringForColumn:@"cardType"] integerValue] ;
                
                CadRecordModel* model = [[CadRecordModel alloc]initWithTitle:strDate cardType:cardType ==  1 ?@"上班卡":@"下班卡" msg:strMsg];
                
                [mtJob addObject:model];
            }
            [tableViewJob reloadData];
        
        }];
 
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
       // [db close];
    }
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
