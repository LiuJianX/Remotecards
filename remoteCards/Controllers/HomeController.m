//
//  HomeController.m
//  E-Campus
//
//  Created by liujianx on 15/7/20.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "HomeController.h"

#import "UIBarButtonItem+WB.h"
#import "Common.h"
#import "StudentMaster.h"
#import "News.h"
#import "Utils.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "FMDatabase.h"
#import "LoginViewController.h"
#import "MobClick.h"
#import "ActivityViewCell.h"
#import "AboutViewController.h"
#import "SerialLocationViewController.h"
#import "JobViewController.h"
#import "ForgetPwdController.h"
#import "ResultViewController.h"
#import "SalaryViewController.h"
#import "PersonViewController.h"
#import "ZCTradeView.h"
#import "MBProgressHUD+MJ.h"
#import "UpdatePwdViewController.h"


@interface HomeController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate
        >{
    UITableView *tableViewNews;
    NSMutableArray *tableData;
    
}
@property (nonatomic,strong) NSMutableArray* Logs;
 @end

@implementation HomeController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  //  [MobClick beginLogPageView:@"PageHome"];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
  //  [MobClick endLogPageView:@"PageHome"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    studented = [Utils loadCustomObjectWithKey:LoginKey];
    
    if(studented == nil){
        
        LoginViewController *viewCtr = [[LoginViewController alloc] init];
        
        viewCtr.title = @"用户登录";
        [self.navigationController pushViewController:viewCtr animated:YES];
        
        
        return;
    }
    

    
    UILabel *labelTime=[[UILabel alloc]initWithFrame:CGRectMake(0.0f,0.0f, 50.0f, 36.0f)];
    labelTime.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    labelTime.font =  HYQIHEISIZE(20);
    
    labelTime.textColor=[UIColor whiteColor];
    
    labelTime.text = @"超业精密";
    self.navigationItem.titleView = labelTime;

    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callCreateMenu)
                                                 name:@"callCreateMenu" object:nil];
    
    self.collectionView.backgroundColor = KLCollectionBkgCollor;//KLColor(231, 231, 231);
    
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    
    tableData = [[NSMutableArray alloc] init];
    
    News *activty = [[News alloc] init];
    activty.title = @"上下班刷卡";
    activty.type = @"1";
    [tableData addObject:activty];
    
    activty = [[News alloc] init];
    activty.title = @"考勤明细";
    activty.type = @"2";
    [tableData addObject:activty];
    
    activty = [[News alloc] init];
    activty.title = @"考勤结果";
    activty.type = @"3";
    [tableData addObject:activty];
    
    activty = [[News alloc] init];
    activty.title = @"我的资料";
    activty.type = @"4";
    [tableData addObject:activty];
    
    activty = [[News alloc] init];
    activty.title = @"我的工资条";
    activty.type = @"5";
    [tableData addObject:activty];
    
    
    
    tableViewNews=[[UITableView alloc]initWithFrame:CGRectMake(0,60, self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    tableViewNews.dataSource=self;
    //设置代理
    tableViewNews.delegate=self;
    
    tableViewNews.rowHeight = 65;
    
    
    [self.view addSubview:tableViewNews];
    
    tableViewNews.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [tableViewNews reloadData];
    

    [self callCreateMenu];
    
    
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/GetIsChangePwd"]];
    ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestForm setPostValue:studented.employee_ID forKey:@"userId"];
    
    [requestForm setTimeOutSeconds:timeOut];
    [requestForm setDelegate:self];
    
    [requestForm setDidFailSelector:@selector(requestChanagePwdFailed:)];
    
    [requestForm setDidFinishSelector:@selector(requestChanagePwdSuccess:)];
    
    
    [requestForm startSynchronous];

    
}


- (void)requestChanagePwdSuccess:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    @try{
        if (request.responseStatusCode == 200) {
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            
            Boolean isChange= [[responseDict objectForKey:@"isChange"] boolValue];
            
            if(isChange){
                
                UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"系统提示" message:@"为了个人资料安全,请先修改密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
                [alterView show];
                
                
                return;
            }
            
            
        } else {
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception] ];
        
    }@finally{
        
    }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    UpdatePwdViewController *update = [[UpdatePwdViewController alloc ]init];
    update.title = @"修改密码";
    [self.navigationController pushViewController:update animated:YES];
    
    
}

- (void)requestChanagePwdFailed:(ASIHTTPRequest *)request{
    
    [ Utils showAllTextDialog:@"网络超时,请稍后再试!"];
    
}


/**
 *  登录之后创建此菜单.
 */
-(void)callCreateMenu{
    
    studented = [Utils loadCustomObjectWithKey:LoginKey];
    
    
    if(studented == nil){
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"登录"
                                                                        style:UIBarButtonItemStyleDone  target:self action:@selector(btnLoginAction:)];
        [rightButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
        
        self.navigationItem.rightBarButtonItem = rightButton;
    
    }else{
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"注销"
                                                                        style:UIBarButtonItemStyleDone  target:self action:@selector(btnUnLoginAction:)];
        
        [ rightButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
        
        
        self.navigationItem.rightBarButtonItem = rightButton;

        
    }
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
  
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%@",studented.name]
                                                                   style:UIBarButtonItemStyleDone  target:nil action:nil];

    [leftButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];

    self.navigationItem.leftBarButtonItem = leftButton;
    
    

    
    
}
- (void)btnUnLoginAction:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"确定要注销账号吗？"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                  otherButtonTitles:nil,nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
    
    
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [Utils resetDefaults];
        
        LoginViewController *viewCtr = [[LoginViewController alloc] init];
        viewCtr.title = @"用户登录";
        [self.navigationController pushViewController:viewCtr animated:YES];
        

        
    }
}


 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return tableData.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}



#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //指定cellIdentifier为自定义的cell
    static NSString *CellIdentifier = @"TableViewCell";
    //自定义cell类
    ActivityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //通过xib的名称加载自定义的cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ActivityViewCell" owner:self options:nil] lastObject];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    News *newModel= [tableData objectAtIndex:indexPath.row];
    
    [cell setNewsData:newModel];
    
    return cell;
 
}
/**
 *  tableView选中事件.
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath <#indexPath description#>
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    //当手指离开某行时，就让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    studented = [Utils loadCustomObjectWithKey:LoginKey];
    
    if(studented == nil){
        [Utils showMBAllTextDialog:@"亲,该功能必须先进行登录哦." view:self.view];
        return;
    }
    
    News *newModel= [tableData objectAtIndex:indexPath.row];
    
    if ([newModel.type isEqualToString:@"1"]){ //上下班刷卡
        
//        SerialLocationViewController *serialMap = [[SerialLocationViewController alloc] init];
//        serialMap.title = @"上下班打卡";
//          [self.navigationController pushViewController:serialMap animated:YES];
        
        AboutViewController *aboutCtr = [[AboutViewController alloc] init];
        aboutCtr.title = newModel.title;
        [self.navigationController pushViewController:aboutCtr animated:YES];

//
//        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//        {
//            
//            
//            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;//设置类型为相机
//            UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
//            picker.delegate = self;//设置代理
//            picker.allowsEditing = YES;//设置照片可编辑
//            picker.sourceType = sourceType;
//            //设置是否显示相机控制按钮 默认为YES
//            picker.showsCameraControls = YES;
//            
//            [self presentViewController:picker animated:YES completion:nil];  //需要以模态的形式展示
//
//            
//            
////                    //创建叠加层(例如添加的相框)
////                    UIView *overLayView=[[UIView alloc]initWithFrame:CGRectMake(0, 120, 320, 254)];
////                    //取景器的背景图片，该图片中间挖掉了一块变成透明，用来显示摄像头获取的图片；
////                    UIImage *overLayImag=[UIImage imageNamed:@"zhaoxiangdingwei.png"];
////                    UIImageView *bgImageView=[[UIImageView alloc]initWithImage:overLayImag];
////                    [overLayView addSubview:bgImageView];
////                    picker.cameraOverlayView=overLayView;
//            
//            
//            //选择前置摄像头或后置摄像头
//            picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
//            [self presentViewController:picker animated:YES completion:^{
//                
//            }];  
//        }  
//        else {  
//            NSLog(@"该设备无相机");  
//        }
    }else if ([newModel.type isEqualToString:@"2"]){ // 考勤明细
        
        JobViewController *aboutCtr = [[JobViewController alloc] init];
        aboutCtr.title = newModel.title;
        [self.navigationController pushViewController:aboutCtr animated:YES];


    }else if ([newModel.type isEqualToString:@"3"]){ // 考勤结果
        ResultViewController *resultCtr = [[ResultViewController alloc] init];
        resultCtr.title = newModel.title;
        [self.navigationController pushViewController:resultCtr animated:YES];
 
        
    }else if ([newModel.type isEqualToString:@"4"]){ // 我的资料
        
        PersonViewController *personC = [[PersonViewController alloc] init];
        
        personC.title = newModel.title;
        [self.navigationController pushViewController:personC animated:YES];
        
    }else if ([newModel.type isEqualToString:@"5"]){ // 我的工资条
        
        SalaryViewController *salaryView = [[SalaryViewController alloc] init];
        salaryView.title = newModel.title;
        [self.navigationController pushViewController:salaryView animated:YES];
 
        
    }else if ([newModel.type isEqualToString:@"6"]){ //
      
        
    }
}






@end
