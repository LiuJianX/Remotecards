//
//  UpdatePwdViewController.h
//  eCampus
//
//  Created by liujianx on 15/9/4.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdatePwdViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgLogin;

@property (strong, nonatomic)  UITextField *txtPassoword;
@property (strong, nonatomic)  UITextField *txtNewPassword;
@property (strong, nonatomic)  UITextField *txtNewPasswordConfirm;


@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;


@property (strong, nonatomic) UILabel *lbl1;
@property (strong, nonatomic) UILabel *lbl2;
@property (strong, nonatomic) UILabel *lbl3;
@property (strong, nonatomic) UILabel *lblName;

@end
