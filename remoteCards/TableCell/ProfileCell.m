//
//  ProfileCell.m
//  remoteCards
//
//  Created by liujianxiong on 2016/11/16.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import "ProfileCell.h"
#import "Utils.h"
#import "Common.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "UpdatePwdViewController.h"
#import "QRCodeGenerator.h"

@implementation ProfileCell{
    NSString *updatePath;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    StudentMaster *stu  = [Utils loadCustomObjectWithKey:LoginKey];
    
      
    
    NSInteger y = 8,h = 25;
    CGFloat w = [Utils getScreenWidth];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(14);
    lbl.text = @"员工编号:";
    [view1 addSubview:lbl];
    _lblEmp_ID = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblEmp_ID.font = HYQIHEISIZE(16);
    _lblEmp_ID.text = stu.employee_ID;
    
    [view1 addSubview:_lblEmp_ID];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(14);
    lbl.text = @"员工姓名:";
    [view1 addSubview:lbl];
    _lblName = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblName.font = HYQIHEISIZE(16);
    _lblName.text = stu.name;
    [view1 addSubview:_lblName];
    
    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(14);
    lbl.text = @"所在部门:";
    [view1 addSubview:lbl];
    _lblDepartName = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblDepartName.font = HYQIHEISIZE(16);
    _lblDepartName.text = stu.departName;
    
    [view1 addSubview:_lblDepartName];

    
    y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(14);
    lbl.text = @"所属职务:";
    [view1 addSubview:lbl];
    _lblDuty = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblDuty.font = HYQIHEISIZE(16);
    _lblDuty.text = stu.duty;
    [view1 addSubview:_lblDuty];

     y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(14);
    lbl.text = @"入职日期:";
    [view1 addSubview:lbl];
    _lbltDate = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lbltDate.font = HYQIHEISIZE(16);
    _lbltDate.text =  stu.employDate;
    [view1 addSubview:_lbltDate];
    
 y = y + h;
    view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    [self addSubview:view1];
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, view1.bounds.size.height)];
    lbl.font = HYQIHEISIZE(14);
    lbl.text = @"当前版本:";
    [view1 addSubview:lbl];
     _lblVer= [[UILabel alloc] initWithFrame:CGRectMake(80, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblVer.font = HYQIHEISIZE(16);
    [view1 addSubview:_lblVer];
    
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    
    _lblVer.text =[NSString stringWithFormat:@"V%@",app_Version];
                                   

     y = y + 50;
  
    UIButton *btnLogin = [[UIButton alloc] init];
    [btnLogin setFrame:CGRectMake(20 , y, 150, 45)];
    [btnLogin setTitle:@"检查更新" forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(btnUpdate) forControlEvents:UIControlEventTouchUpInside];
    btnLogin.titleLabel.font =  HYQIHEISIZE(18);
    [btnLogin setBackgroundColor:NavFontColor];
    
    [self addSubview:btnLogin];
 
 
    UIButton *btnPwd = [[UIButton alloc] init];
    [btnPwd setFrame:CGRectMake(w / 2  , y, 150, 45)];
    [btnPwd setTitle:@"修改密码" forState:UIControlStateNormal];
    [btnPwd addTarget:self action:@selector(btnUpdatePwd) forControlEvents:UIControlEventTouchUpInside];
    btnPwd.titleLabel.font =  HYQIHEISIZE(18);
    [btnPwd setBackgroundColor:NavFontColor];
    
    [self addSubview:btnPwd];
    
     y = y + 50;
    
    _imgCode = [[UIImageView alloc]initWithFrame:CGRectMake([Utils getScreenWidth] / 2 - 110, y, 220, 210)];
    
    _imgCode.image = [QRCodeGenerator qrImageForString:appUrl imageSize:_imgCode.bounds.size.width];
    
    [self addSubview: _imgCode];
    y = y +180;

    _lblTip = [[UILabel alloc]initWithFrame:CGRectMake([Utils getScreenWidth] / 2 - 90, y, [Utils getScreenWidth] - 20 , 60)];
    _lblTip.numberOfLines = 0 ;
    _lblTip.font = HYQIHEI;
    _lblTip.text = @"超业精密打卡软件下载地址分享";
    [self addSubview:_lblTip];


    
}

-(void)btnUpdate{
    
    self.buttonUpdatePwdBlock(self);
    
    
}
-(void)btnUpdatePwd{

    self.selectAddressJobBlock(self);
    

    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
