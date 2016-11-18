//
//  UpdatePwdViewController.m
//  eCampus
//
//  Created by liujianx on 15/9/4.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "UpdatePwdViewController.h"
#import "Common.h"
#import "Utils.h"
#import "LoginViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "StudentMaster.h"
 #import "MBProgressHUD+MJ.h"

@interface UpdatePwdViewController ()<UIAlertViewDelegate>{
    StudentMaster *stu;
}

@end

@implementation UpdatePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     stu = [Utils loadCustomObjectWithKey:LoginKey];
    
    UIView *imgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [Utils getScreenWidth], 177)];
  //  imgView.backgroundColor = NavFontColor;
    
    [self.view addSubview:imgView];
    
 

     UIButton *btnLoginText = [[UIButton alloc]initWithFrame:CGRectMake([Utils getScreenWidth] / 2 - 30, 140, 60, 25)];
     [btnLoginText setTitle:stu.name forState:UIControlStateNormal];
     btnLoginText.titleLabel.font = HYQIHEI;
    
    [btnLoginText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    btnLoginText.titleLabel.textAlignment = NSTextAlignmentCenter;
    
  //  [imgView addSubview:btnLoginText];
    
    
    
    UIImage *lineImage = [UIImage imageNamed:@"login_textfield_mid.png"];
    
    
    
//    _lbl1 =  [[UILabel alloc] initWithFrame:CGRectMake(24,230,49,21)];
//    _lbl1.font = HYQIHEI;
//    _lbl1.text = @"原始密码";
//    [self.view addSubview:_lbl1];
    
    _txtPassoword = [[UITextField alloc] initWithFrame:CGRectMake(15,224-150,[Utils getScreenWidth]-20,36)];
    _txtPassoword.font = HYQIHEI;
    _txtPassoword.keyboardType = UIKeyboardTypeASCIICapable;
    _txtPassoword.secureTextEntry  = YES;
    _txtPassoword.placeholder=@"你的原始密码";
    [self.view addSubview:_txtPassoword];
    
    UIImageView *imgLine1 = [[UIImageView alloc] initWithFrame:CGRectMake(1,255-150,[Utils getScreenWidth],1)];
    imgLine1.image = lineImage;
    [self.view addSubview:imgLine1];
 
//    _lbl2 =  [[UILabel alloc] initWithFrame:CGRectMake(24,275,49,21)];
//    _lbl2.font = HYQIHEI;
//    _lbl2.text = @"新密码";
//    [self.view addSubview:_lbl2];
    
    _txtNewPassword = [[UITextField alloc] initWithFrame:CGRectMake(15,269-150,[Utils getScreenWidth]-30,36)];
    _txtNewPassword.font = HYQIHEI;
    _txtNewPassword.keyboardType = UIKeyboardTypeASCIICapable;
    _txtNewPassword.secureTextEntry  = YES;
    _txtNewPassword.placeholder=@"输入新密码";
    [self.view addSubview:_txtNewPassword];
    
    UIImageView *imgLine2 = [[UIImageView alloc] initWithFrame:CGRectMake(15,300-150,[Utils getScreenWidth],1)];
    imgLine2.image = [UIImage imageNamed:@"login_textfield_mid.png"];
    [self.view addSubview:imgLine2];
    
    
//    _lbl3 =  [[UILabel alloc] initWithFrame:CGRectMake(24,320,49,21)];
//    _lbl3.font = HYQIHEI;
//    _lbl3.text = @"确认密码";
//    [self.view addSubview:_lbl3];
    
    _txtNewPasswordConfirm = [[UITextField alloc] initWithFrame:CGRectMake(15,314-150,[Utils getScreenWidth]-30,36)];
    _txtNewPasswordConfirm.font = HYQIHEI;
    _txtNewPasswordConfirm.keyboardType = UIKeyboardTypeASCIICapable;
    _txtNewPasswordConfirm.secureTextEntry  = YES;
    _txtNewPasswordConfirm.placeholder=@"确认新密码";
    [self.view addSubview:_txtNewPasswordConfirm];
    
    UIImageView *imgLine3 = [[UIImageView alloc] initWithFrame:CGRectMake(15,345-150,[Utils getScreenWidth],1)];
    imgLine3.image = lineImage;
    [self.view addSubview:imgLine3];

    
    
    UIButton *btnLogin = [[UIButton alloc] init];
    [btnLogin setFrame:CGRectMake(20 , 370-150, [Utils getScreenWidth]-40, 34)];
    [btnLogin setTitle:@"确 定" forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(actionButtonConfirm:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin.titleLabel.font =  HYQIHEISIZE(14);
    [btnLogin setBackgroundColor:NavFontColor];
    
    [self.view addSubview:btnLogin];

//    
//    
//    // 1. 用一个临时变量保存返回值。
//    CGRect temp = _imgLogin.frame;
//    
//    // 2. 给这个变量赋值。因为变量都是L-Value，可以被赋值
//    temp.size.width = [Utils getScreenWidth];
//    
//    // 3. 修改frame的值
//    self.view.frame = temp;
//    
//    _imgLogin.frame = temp;
//    
//    _imgLogin.layer.cornerRadius = _imgLogin.frame.size.width / 2;
//    _imgLogin.clipsToBounds = YES;
//    _imgLogin.layer.borderWidth = 1.0f;
//    _imgLogin.layer.borderColor = [UIColor whiteColor].CGColor;
//    _imgLogin.layer.cornerRadius = 30.0f;
//    
//    _lbl1.font = HYQIHEI;
//    _lbl2.font = HYQIHEI;
//    _lbl3.font = HYQIHEI;
//    _lblName.font = HYQIHEI;
//   
//    _lblName.text = stu.name;
//    _txtNewPassword.font = HYQIHEI;
//    _txtNewPasswordConfirm.font = HYQIHEI;
//    _txtPassoword.font = HYQIHEI;
//    _btnConfirm.titleLabel.font = HYQIHEISIZE(16);
//    
//    _txtNewPassword.secureTextEntry = YES;
//    _txtPassoword.secureTextEntry = YES;
//    _txtNewPasswordConfirm.secureTextEntry = YES;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(backButtonData:)];
    [backButton setTitleTextAttributes:@{NSFontAttributeName:HYQIHEISIZE(14)} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    

    
}
-  (void)backButtonData:(id)sender{
    
        [self.navigationController popViewControllerAnimated:YES];
    
  //  [self.navigationController popToRootViewControllerAnimated:YES];
    
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

- (void)actionButtonConfirm:(id)sender {
    
    
    if(_txtPassoword.text.length <= 0){
        [Utils showMBAllTextDialog:@"原密码不能为空" view:self.view];
        return;
    }
    if(_txtNewPassword.text.length <= 0){
        [Utils showMBAllTextDialog:@"新密码不能为空" view:self.view];
        return;
    }

    
    if(_txtNewPassword.text.length < 6){
        [Utils showMBAllTextDialog:@"密码长度不能小于6位" view:self.view];
        return;
    }
    if([_txtNewPassword.text isEqualToString:_txtNewPasswordConfirm.text] == NO){
        [Utils showMBAllTextDialog:@"两次密码输入不一致" view:self.view];
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"数据保存中,请稍候...";
    
    NSURL *url = [NSURL URLWithString:[urlServer stringByAppendingString:@"App/UpdatePwd"]];
    ASIFormDataRequest *requestNews = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [requestNews setPostValue: stu.employee_ID forKey:@"userId"];
    [requestNews setPostValue: _txtPassoword.text forKey:@"oldPwd"];
    [requestNews setPostValue: _txtNewPassword.text forKey:@"newPwd"];
    
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
            
            NSString *errMsg= [responseDict objectForKey:@"errMsg"];
            if(errMsg !=nil && ![errMsg isEqualToString:@""]){
                
                [Utils showAllTextDialog: [NSString stringWithFormat:@"发生错误,原因:%@",errMsg]];
                
                return;
            }
          
            [Utils resetDefaults];
             
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:@"密码修改成功,请重新登录" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
            [alterView show];
            
            
        }else{
             [Utils showAllTextDialog: @"网络超时,请稍后再试!"];
        }
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
}
//根据被点击按钮的索引处理点击事件
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    LoginViewController *viewCtr = [[LoginViewController alloc] init];
    
    viewCtr.title = @"用户登录";
    [self.navigationController pushViewController:viewCtr animated:YES];

    
    
   //  [self.navigationController popToRootViewControllerAnimated:YES];
    
//    ProfileController* loginCtr = [[ProfileController alloc] init];
//    loginCtr.title = @"个人中心";
//    [self.navigationController pushViewController:loginCtr animated:YES];
    

}


- (void)requestNewsFailed:(ASIHTTPRequest *)request
{
    
    //NSError *error = [request error];
    
    [ Utils showAllTextDialog: @"网络超时,请稍后再试!"];
    
    
}



@end
