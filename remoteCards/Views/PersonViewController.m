//
//  JobViewController.m
//  eCampus
//
//  Created by liujianx on 15/8/30.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "PersonViewController.h"
#import "Common.h"
#import "ProfileCell.h"
#import "EMoney.h"
#import "UIImage+WB.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "MobClick.h"
#import <CommonCrypto/CommonCryptor.h>
#import "UpdatePwdViewController.h"
#import "QRCodeGenerator.h"

@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
    
    UITableView *tableViewJob;
    NSMutableArray *mtJob;
    NSArray *arrSelctedJob;
    NSString *jobName,*year,*month,*updatePath;
    UITableViewHeaderFooterView *header;
}

@end

@implementation PersonViewController

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
    
    
   //
//    
//    UIButton *btnLogin = [[UIButton alloc] init];
//    [btnLogin setFrame:CGRectMake(20 , y, 150, 45)];
//    [btnLogin setTitle:@"检查更新" forState:UIControlStateNormal];
//    [btnLogin addTarget:self action:@selector(btnUpdate) forControlEvents:UIControlEventTouchUpInside];
//    btnLogin.titleLabel.font =  HYQIHEISIZE(18);
//    [btnLogin setBackgroundColor:NavFontColor];
//    
//    [self.view addSubview:btnLogin];
//    
//    
//    
//    UIButton *btnPwd = [[UIButton alloc] init];
//    [btnPwd setFrame:CGRectMake(w / 2  , y, 150, 45)];
//    [btnPwd setTitle:@"修改密码" forState:UIControlStateNormal];
//    [btnPwd addTarget:self action:@selector(btnUpdatePwd) forControlEvents:UIControlEventTouchUpInside];
//    btnPwd.titleLabel.font =  HYQIHEISIZE(18);
//    [btnPwd setBackgroundColor:NavFontColor];
//    
//    [self.view addSubview:btnPwd];
    
}



- (void)backButtonData:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifierCell = @"ProfileCellIdentifier";
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
     
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProfileCell" owner:self options:nil] lastObject];
        
    }
    cell.selectAddressJobBlock = ^(ProfileCell *cellJob){
        
            UpdatePwdViewController *update = [[UpdatePwdViewController alloc ]init];
            update.title = @"修改密码";
            [self.navigationController pushViewController:update animated:YES];
        
    };
    
    cell.buttonUpdatePwdBlock = ^(ProfileCell *cellJob){
        
        [self checkVersion];
        
    };
    
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
    
    return 1;
    
    
}




- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 1;
    
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



/**
 *  检测软件是否需要升级
 */
-(void)checkVersion
{
    //NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%i",iFeverAPPID]];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"检查最新版本中,请稍后...";
    
    
    
    
    NSURL *url = [NSURL URLWithString:updateUrl];
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc]initWithURL:url];
    [request setUseCookiePersistence:YES];
    [request setDelegate: self];
    [request setDidFailSelector:@selector(getVersionRequestFailed:)];
    [request setDidFinishSelector:@selector(getVersionRequestSuccess:)];
    [request startAsynchronous];//开始异步请求
}

-(void)getVersionRequestFailed:(ASIHTTPRequest *)request1
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    KLLog(@"从AppStore获取版本信息失败！！");
}

-(void)getVersionRequestSuccess:(ASIHTTPRequest *)request1
{
    NSString *newVersion;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if (request1.responseStatusCode == 200) {
        NSString *responseString = [request1 responseString];
        NSMutableDictionary *responseDict = [responseString JSONValue];
        responseDict = [responseDict objectForKey:@"ios"];
        
        newVersion = [responseDict objectForKey:@"version"];
        
        NSInteger build = [[responseDict objectForKey:@"build"] integerValue];
        
        updatePath =  [responseDict objectForKey:@"path"];
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
        
     //   NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        // app build版本
        NSInteger app_build = [[infoDictionary objectForKey:@"CFBundleVersion"] integerValue];
        
        
        // NSString *msg = [NSString stringWithFormat:@"你当前的版本是V%@，发现新版本V%@，是否立即升级新版本？",app_Version,newVersion];
        
        if (build > app_build) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"系统提示" message:@"检测到新版本,请立即升级!" delegate:self cancelButtonTitle:@"立即升级" otherButtonTitles:nil, nil];
            alert.tag = 1;
            [alert show];

            return;
        }else{
            [Utils showMBAllTextDialog:@"亲,当前版本已经是最新的啦." view:self.view];
            
        }
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
        //软件需要更新提醒
        //  if (buttonIndex == 1) {
        // NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/wan-zhuan-quan-cheng/id%i?mt=8",iFeverAPPID]];
        
        NSURL *url = [NSURL URLWithString:updatePath];
        
        [[UIApplication sharedApplication] openURL:url];
        
        //   }
    }
}



@end
