//
//  LoginViewController.h
//  eCampus
//
//  Created by liujianx on 15/10/29.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LoginViewController : UIViewController

@property (nonatomic,strong) AppDelegate *appDelegate;

@property (strong, nonatomic) UITextField *txtEmail;
@property (strong, nonatomic) UITextField *txtPassword; 

@end
