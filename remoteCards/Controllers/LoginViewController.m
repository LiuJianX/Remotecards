//
//  LoginViewController.m
//  eCampus
//
//  Created by liujianx on 15/10/29.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "LoginViewController.h"
#import "Common.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "MBProgressHUD+MJ.h"
#import "StudentMaster.h"
#import "Utils.h"
#import "UpdatePwdViewController.h"
#import "MobClick.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMenu];
    [self initControl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initMenu{
    self.view.backgroundColor = KLCollectionBkgCollor;//(231, 231, 231);
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callBackRegister:)
                                                 name:@"callBackSuccessRegister" object:nil];
    
    
    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:nil];
    [backButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = backButton;
    self.navigationItem.hidesBackButton = YES;
    
    
}

- (IBAction)touchView:(id)sender {
    [self.view endEditing:YES];
}
- (void)initControl{
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchView:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    NSString *cLabelString = @"东莞市超业精密设备有限公司";
   
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setFrame:CGRectMake(0, 110, [Utils getScreenWidth], 21)];
    [lbl setText:cLabelString];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:HYQIHEISIZE(20)];
    [lbl setTextColor:NavFontColor];
    
    [self.view addSubview:lbl];
  
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    
    

    UILabel *logoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 132, [Utils getScreenWidth] - 20 , 30)];
    [logoLabel setText: [NSString stringWithFormat:@"V%@",app_Version]];
    [logoLabel setTextColor:NavFontColor];
    [logoLabel setTextAlignment:NSTextAlignmentCenter];
    logoLabel.font =  HYQIHEISIZE(16);
    [self.view addSubview:logoLabel];
    
    
    
    UIImageView *emailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 ,197, [Utils getScreenWidth] - 40 ,36)];
    [emailImageView setImage:[UIImage imageNamed:@"textfield"]];
    [self.view addSubview:emailImageView];

    self.txtEmail = [[UITextField alloc] initWithFrame:CGRectMake(30, 200, [Utils getScreenWidth] - 40, 36)];
    [self.txtEmail addTarget:self action:@selector(emailAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    self.txtEmail.keyboardType = UIKeyboardTypeNumberPad;// UIKeyboardTypeEmailAddress;
    self.txtEmail.placeholder=@"输入工号";
    
    //[self.txtEmail becomeFirstResponder];
    self.txtEmail.font = HYQIHEISIZE(12);
    [self.view  addSubview:self.txtEmail];
    
    PaperAnswer *anser = [Utils loadPaperAnswerObjectWithKey:AnswersWrittingKey];
    self.txtEmail.text = anser.answerTitle;
    
    
    UIImageView *emailLabelLine = [[UIImageView alloc] initWithFrame:CGRectMake(20 ,231, [Utils getScreenWidth]  - 40 ,1)];
    [emailLabelLine setImage:[UIImage imageNamed:@"login_textfield_mid"]];
    [self.view addSubview:emailLabelLine];

    
    
    UIImageView *pwdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 ,233, [Utils getScreenWidth] - 40 ,36)];
    [pwdImageView setImage:[UIImage imageNamed:@"textfield"]];
    [self.view addSubview:pwdImageView];
    
    
    
    self.txtPassword = [[UITextField alloc]initWithFrame:CGRectMake(30, 238, [Utils getScreenWidth] - 40, 36)];
    self.txtPassword.placeholder=@"输入登录密码";
    self.txtPassword.keyboardType = UIKeyboardTypeASCIICapable;
    self.txtPassword.font = HYQIHEISIZE(12);
    self.txtPassword.secureTextEntry  = YES;
    [self.txtPassword addTarget:self action:@selector(passWordAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:self.txtPassword];
    
    
    
    pwdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 ,270, [Utils getScreenWidth] - 40,1)];
    [pwdImageView setImage:[UIImage imageNamed:@"login_textfield_mid"]];
    [self.view addSubview:pwdImageView];

    
    
    UIButton *btnLogin = [[UIButton alloc] init];
    [btnLogin setFrame:CGRectMake(20 , 290, [Utils getScreenWidth] - 40, 34)];
    [btnLogin setTitle:@"登 录" forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(btnLoginAction:) forControlEvents:UIControlEventTouchUpInside];
     btnLogin.titleLabel.font =  HYQIHEISIZE(18);
    [btnLogin setBackgroundColor:NavFontColor];

    [self.view addSubview:btnLogin];
    
//    
//    UIButton *btnForget = [[UIButton alloc] init];
//    [btnForget setFrame:CGRectMake(20, 335,60, 34)];
//    [btnForget setTitle:@"忘记密码" forState:UIControlStateNormal];
//    [btnForget addTarget:self action:@selector(btnForgetClick:) forControlEvents:UIControlEventTouchUpInside];
//     btnForget.titleLabel.font =  HYQIHEISIZE(12);
//    [btnForget setTitleColor:NavFontColor forState:UIControlStateNormal];
//    
//    [self.view addSubview:btnForget];
//
//    
//    UIButton *btnReg = [[UIButton alloc] init];
//    [btnReg setFrame:CGRectMake([Utils getScreenWidth] - 80 , 335 ,60, 34)];
//    [btnReg setTitle:@"没有账号?" forState:UIControlStateNormal];
//    [btnReg addTarget:self action:@selector(btnRegClick:) forControlEvents:UIControlEventTouchUpInside];
//    btnReg.titleLabel.font =  HYQIHEISIZE(12);
//    [btnReg setTitleColor:NavFontColor forState:UIControlStateNormal];
//    
//    [self.view addSubview:btnReg];
    
}
- (void)btnForgetClick:(id)sender {
    
//    ForgetPwdController  *viewCtr = [[ForgetPwdController alloc] init];
//    viewCtr.title = @"重置密码";
//    [self.navigationController pushViewController:viewCtr animated:YES];
    
    
}
- (void)emailAction:(id)sender{
    [self.txtPassword becomeFirstResponder];
}
- (void)passWordAction:(id)sender {
    // 隐藏键盘.
    [sender resignFirstResponder];
    [self btnLoginAction:nil];
    
}
- (void)btnRegClick:(id)sender {
    
//    RegViewController *loginCtr = [[RegViewController alloc]init];
//    loginCtr.title = @"用户注册";
//    
//    [self.navigationController pushViewController:loginCtr animated:YES];
//    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtEmail resignFirstResponder];
    [self.txtPassword resignFirstResponder];
}


//返回
- (void)backButtonData :(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)btnQuery :(id)sender {

    
    
}


- (void)callBackRegister:(NSNotification*)notification{
    
    NSDictionary *nameDictionary = [notification userInfo];
    self.txtEmail.text = [nameDictionary objectForKey:@"email"];
    
}


- (void)btnLoginAction:(id)sender {
    
    [self.view endEditing:YES];
    
    if(self.txtEmail.text.length==0 || [self.txtEmail.text isEqualToString:@""]){
        [Utils showMBAllTextDialog: @"请填写账号" view:self.view];
        return;
        
    }
    if(self.txtPassword.text.length ==0 || [self.txtPassword.text isEqualToString:@""]){
        [Utils showMBAllTextDialog: @"请填写密码" view:self.view];
        
        
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"登录中,请稍候...";
    
    
    
   
    
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/UserLogin"]];
    ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestForm setPostValue:self.txtEmail.text forKey:@"userId"];
    [requestForm setPostValue:self.txtPassword.text forKey:@"pwd"];
 //   [requestForm setPostValue:[NSString stringWithFormat:@"ios:%@ - %@",[[UIDevice currentDevice] systemVersion],app_Version]forKey:@"ver"];
    
    [requestForm setDelegate:self];
    [requestForm setTimeOutSeconds:timeOut];
    [requestForm startSynchronous];
    
    
}


- (void)requestFinished:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    @try{
        if (request.responseStatusCode == 200) {
            NSString *responseString = [request responseString];
            NSMutableDictionary *responseDict = [responseString JSONValue];
            
            NSMutableDictionary *mData  = [responseDict objectForKey:@"m"];
            
            if(!mData || mData.count<=0){
                [Utils showAllTextDialog: @"服务器未找到可用的数据"];
                return;
            }
            
            NSString *errMsg = [responseDict objectForKey:@"errMsg"];
            if(![errMsg isEqualToString:@""]){
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [Utils showAllTextDialog: [NSString stringWithFormat:@"发生错误,原因:%@",errMsg]];
                
                return;
            }
            
           
            
            StudentMaster* testObj = [[StudentMaster alloc] init];
            
            
            testObj.employee_ID= [mData objectForKey:@"Employee_ID"];
            testObj.password=[mData objectForKey:@"Password"];
            testObj.departName =[mData objectForKey:@"DepartName"];
            testObj.name=[mData objectForKey:@"Name"];
            testObj.duty = [mData objectForKey:@"Duty"];
            
            testObj.position = [mData objectForKey:@"Position"];
            
            testObj.employDate = [mData objectForKey:@"EmployDate"];
            
            testObj.workId = [mData objectForKey:@"WorkID"];
            
            
            [Utils saveCustomObject:testObj];
            
            PaperAnswer *anser = [[PaperAnswer alloc] init];
            anser.answerTitle= testObj.employee_ID;
            
            [Utils savePaperAnswerObject:anser];
            
            Boolean isChange= [[responseDict objectForKey:@"isChange"] boolValue];
            
            if(isChange){
                
                UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"系统提示" message:@"为了个人资料安全,请先修改密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
                [alterView show];
                
                
                return;
            }
            
          
            [[NSNotificationCenter defaultCenter] postNotificationName:@"callCreateMenu" object:self];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"callBackSuccessLogin" object:self] ;
            
            if(_appDelegate == nil)
                _appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            
            [_appDelegate initSystem];
            
        } else {
            [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception] ];
        
    }@finally{
        
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    
    [ Utils showAllTextDialog:@"网络超时,请稍后再试!"];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    UpdatePwdViewController *update = [[UpdatePwdViewController alloc ]init];
    update.title = @"修改密码";
    [self.navigationController pushViewController:update animated:YES];
    
    
}



@end
