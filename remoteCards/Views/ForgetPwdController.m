//
//  ForgetPwdController.m
//  eCampus
//
//  Created by liujianx on 15/9/7.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "ForgetPwdController.h"
#import "Common.h"
#import "Utils.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "StudentMaster.h"

#import "MBProgressHUD+MJ.h"
@interface ForgetPwdController ()<UIAlertViewDelegate,UIActionSheetDelegate>{
    StudentMaster *stu;

}

@end

@implementation ForgetPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      stu = [Utils loadCustomObjectWithKey:LoginKey];
    
    
    
    UIButton *btnLogin = [[UIButton alloc] init];
    [btnLogin setFrame:CGRectMake(20 , 80, 150, 34)];
    [btnLogin setTitle:@"游戏一(下)" forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(btnConfirm:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin.titleLabel.font =  HYQIHEISIZE(14);
    [btnLogin setBackgroundColor:NavFontColor];
    
    [self.view addSubview:btnLogin];
    
    UIButton *btnLogin1 = [[UIButton alloc] init];
    [btnLogin1 setFrame:CGRectMake(200 , 80, 150, 34)];
    [btnLogin1 setTitle:@"游戏一(下)" forState:UIControlStateNormal];
    [btnLogin1 addTarget:self action:@selector(btnConfirm1:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin1.titleLabel.font =  HYQIHEISIZE(14);
    [btnLogin1 setBackgroundColor:NavFontColor];
    
    [self.view addSubview:btnLogin1];

    
    
    UIButton *btnLogin2 = [[UIButton alloc] init];
    [btnLogin2 setFrame:CGRectMake(20 , 180, 150, 34)];
    [btnLogin2 setTitle:@"游戏二(上)" forState:UIControlStateNormal];
    [btnLogin2 addTarget:self action:@selector(btnConfirm2:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin2.titleLabel.font =  HYQIHEISIZE(14);
    [btnLogin2 setBackgroundColor:NavFontColor];
    
    [self.view addSubview:btnLogin2];

    UIButton *btnLogin3 = [[UIButton alloc] init];
    [btnLogin3 setFrame:CGRectMake(200 , 180,150, 34)];
    [btnLogin3 setTitle:@"游戏二(下)" forState:UIControlStateNormal];
    [btnLogin3 addTarget:self action:@selector(btnConfirm3:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin3.titleLabel.font =  HYQIHEISIZE(14);
    [btnLogin3 setBackgroundColor:NavFontColor];
    
    [self.view addSubview:btnLogin3];
 
    
    UIButton *btnLogin4 = [[UIButton alloc] init];
    [btnLogin4 setFrame:CGRectMake(20 , 280, 150, 34)];
    [btnLogin4 setTitle:@"游戏三(上)" forState:UIControlStateNormal];
    [btnLogin4 addTarget:self action:@selector(btnConfirm4:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin4.titleLabel.font =  HYQIHEISIZE(14);
    [btnLogin4 setBackgroundColor:NavFontColor];
    
    [self.view addSubview:btnLogin4];
   
    
    UIButton *btnLogin5 = [[UIButton alloc] init];
    [btnLogin5 setFrame:CGRectMake(200 , 280,150, 34)];
    [btnLogin5 setTitle:@"游戏三(下)" forState:UIControlStateNormal];
    [btnLogin5 addTarget:self action:@selector(btnConfirm5:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin5.titleLabel.font =  HYQIHEISIZE(14);
    [btnLogin5 setBackgroundColor:NavFontColor];
    
    [self.view addSubview:btnLogin5];
    
    
    UIButton *btnLogin6= [[UIButton alloc] init];
    [btnLogin6 setFrame:CGRectMake(50,400,150, 34)];
    [btnLogin6 setTitle:@"获取时间" forState:UIControlStateNormal];
    [btnLogin6 addTarget:self action:@selector(getDate) forControlEvents:UIControlEventTouchUpInside];
    btnLogin6.titleLabel.font =  HYQIHEISIZE(14);
    [btnLogin6 setBackgroundColor:NavFontColor];
    [self.view addSubview:btnLogin6];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    
    
    _txtEmail = [[UITextField alloc] initWithFrame:CGRectMake(10,350,100,36)];
    _txtEmail.font = HYQIHEI;
    self.txtEmail.keyboardType = UIKeyboardTypeNumberPad;
    _txtEmail.text = strDate;
    [self.view addSubview:_txtEmail];
    
    
    _txtTime = [[UITextField alloc] initWithFrame:CGRectMake(250,350,100,36)];
    _txtTime.font = HYQIHEI;
    _txtTime.keyboardType = UIKeyboardTypeNumberPad;
    _txtTime.text = @"21";
    [self.view addSubview:_txtTime];
    

    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(backButtonData:)];
    [backButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
 
    
}



-(void)getDate{
    
             UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeDate;
         
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:  UIAlertControllerStyleActionSheet];
        
        [alert.view addSubview:datePicker];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
            
            //实例化一个NSDateFormatter对象
            
            [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式
            
             _txtEmail.text = [dateFormat stringFromDate:datePicker.date];
            
        }];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alert addAction:ok];
        
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:^{ }];
        
    
    
}



-  (void)backButtonData:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)btnConfirm:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"数据保存中,请稍候...";
    
    
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/UpdateCard1"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestNews setPostValue:stu.employee_ID  forKey:@"userId"];
   [requestNews setPostValue: _txtEmail.text forKey:@"cDate"];
    [requestNews setDelegate:self];
    
    [requestNews setDidFailSelector:@selector(requestNewsFailed:)];
    
    [requestNews setDidFinishSelector:@selector(requestNewsDidSuccess:)];
    
    [requestNews setTimeOutSeconds:timeOut];
    
    [requestNews startSynchronous];
    
}



- (void)requestNewsDidSuccess:(ASIHTTPRequest *)request
{
     [MBProgressHUD hideHUDForView:self.view animated:YES];
    @try {
        if (request.responseStatusCode == 200) {
            
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            if(!responseDict || responseDict.count<=0){
                [Utils showAllTextDialog: @"服务器未找到可用的数据"];
                return;
            }
            
            
            NSString *msg= [responseDict objectForKey:@"errMsg"];
            if( [msg isEqualToString:@""] == NO){
                [Utils showAllTextDialog: msg];
                return;
            }
            
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"打卡成功!"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
           
            [alterView show];
            
        }else{
           [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
}



//根据被点击按钮的

- (void)requestNewsFailed:(ASIHTTPRequest *)request
{
    
     [MBProgressHUD hideHUDForView:self.view animated:YES];
    [ Utils showAllTextDialog: @"网络超时,请稍后再试!"];
    
    
}


- (void)btnConfirm1:(id)sender {
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"数据保存中,请稍候...";

    
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/UpdateCardDown"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
    [requestNews setPostValue:stu.employee_ID  forKey:@"userId"];
    [requestNews setPostValue: _txtEmail.text forKey:@"cDate"];
    [requestNews setDelegate:self];
    
    
    [requestNews setDidFinishSelector:@selector(requestNewsDidSuccess1:)];
    
    [requestNews setTimeOutSeconds:timeOut];
    
    [requestNews startSynchronous];
    
    
}



- (void)requestNewsDidSuccess1:(ASIHTTPRequest *)request
{ [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    @try {
        if (request.responseStatusCode == 200) {
            
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            if(!responseDict || responseDict.count<=0){
                [Utils showAllTextDialog: @"服务器未找到可用的数据"];
                return;
            }
            
            NSString *msg= [responseDict objectForKey:@"errMsg"];
            if( [msg isEqualToString:@""] == NO){
                [Utils showAllTextDialog: msg];
                return;
            }
            
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"打卡成功!"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
            
            [alterView show];
            
        }else{
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
}



- (void)btnConfirm2:(id)sender {
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"数据保存中,请稍候...";

    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/UpdateCard2"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestNews setPostValue:stu.employee_ID  forKey:@"userId"];
    
    [requestNews setPostValue: _txtEmail.text forKey:@"cDate"];
    
    [requestNews setDelegate:self];
    
    
    [requestNews setDidFinishSelector:@selector(requestNewsDidSuccess2:)];
    
    [requestNews setTimeOutSeconds:timeOut];
    
    [requestNews startSynchronous];
    
    
}



- (void)requestNewsDidSuccess2:(ASIHTTPRequest *)request
{ [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    @try {
        if (request.responseStatusCode == 200) {
            
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            if(!responseDict || responseDict.count<=0){
                [Utils showAllTextDialog: @"服务器未找到可用的数据"];
                return;
            }
            
            NSString *msg= [responseDict objectForKey:@"errMsg"];
            if( [msg isEqualToString:@""] == NO){
                [Utils showAllTextDialog: msg];
                return;
            }
            
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"打卡成功!"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
            
            [alterView show];
            
            
        }else{
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
}



- (void)btnConfirm3:(id)sender {
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"数据保存中,请稍候...";

    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/UpdateCardDown6"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestNews setPostValue:stu.employee_ID  forKey:@"userId"];
    [requestNews setPostValue: _txtEmail.text forKey:@"cDate"];
    
    [requestNews setDelegate:self];
    
    
    [requestNews setDidFinishSelector:@selector(requestNewsDidSuccess3:)];
    
    [requestNews setTimeOutSeconds:timeOut];
    
    [requestNews startSynchronous];
    
    
}



- (void)requestNewsDidSuccess3:(ASIHTTPRequest *)request
{
     [MBProgressHUD hideHUDForView:self.view animated:YES];
    @try {
        if (request.responseStatusCode == 200) {
            
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            if(!responseDict || responseDict.count<=0){
                [Utils showAllTextDialog: @"服务器未找到可用的数据"];
                return;
            }
            NSString *msg= [responseDict objectForKey:@"errMsg"];
            if( [msg isEqualToString:@""] == NO){
                [Utils showAllTextDialog: msg];
                return;
            }
            
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"打卡成功!"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
            
            [alterView show];
            
        }else{
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
}




- (void)btnConfirm4:(id)sender {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"获取数据中,请稍候...";
    
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/UpdateCardBegin3"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
  
    [requestNews setPostValue:stu.employee_ID  forKey:@"userId"];
    [requestNews setPostValue: _txtEmail.text forKey:@"cDate"];
    
    
    [requestNews setDelegate:self];
    
    
    [requestNews setDidFinishSelector:@selector(requestNewsDidSuccess4:)];
    
    [requestNews setTimeOutSeconds:timeOut];
    
    [requestNews startSynchronous];
    
    
}



- (void)requestNewsDidSuccess4:(ASIHTTPRequest *)request
{
     [MBProgressHUD hideHUDForView:self.view animated:YES];
    @try {
        if (request.responseStatusCode == 200) {
            
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            if(!responseDict || responseDict.count<=0){
                [Utils showAllTextDialog: @"服务器未找到可用的数据"];
                return;
            }
            NSString *msg= [responseDict objectForKey:@"errMsg"];
            if( [msg isEqualToString:@""] == NO){
                [Utils showAllTextDialog: msg];
                return;
            }
            
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"打卡成功!"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
            
            [alterView show];
        
        }else{
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
}



- (void)btnConfirm5:(id)sender {
    
    if([_txtTime.text isEqualToString:@""]){
        [Utils showAllTextDialog: @"小时不能为空!"];
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"数据保存中,请稍候...";

    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/UpdateCardDown2"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestNews setPostValue:stu.employee_ID  forKey:@"userId"];
   [requestNews setPostValue: _txtTime.text forKey:@"cHour"];
    [requestNews setPostValue: _txtEmail.text forKey:@"cDate"];
    
    [requestNews setDelegate:self];
    
    
    [requestNews setDidFinishSelector:@selector(requestNewsDidSuccess5:)];
    
    [requestNews setTimeOutSeconds:timeOut];
    
    [requestNews startSynchronous];
    
    
}



- (void)requestNewsDidSuccess5:(ASIHTTPRequest *)request
{
     [MBProgressHUD hideHUDForView:self.view animated:YES];
    @try {
        if (request.responseStatusCode == 200) {
            
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            if(!responseDict || responseDict.count<=0){
                [Utils showAllTextDialog: @"服务器未找到可用的数据"];
                return;
            }
            NSString *msg= [responseDict objectForKey:@"errMsg"];
            if( [msg isEqualToString:@""] == NO){
                [Utils showAllTextDialog: msg];
                return;
            }
            
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"打卡成功!"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
            
            [alterView show];
            
        }else{
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
}




@end
