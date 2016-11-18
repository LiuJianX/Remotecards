//
//  ViewController.m
//  remoteCards
//
//  Created by liujianxiong on 2016/11/8.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "AppDelegate.h"
#import "MobClick.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    studented = [Utils loadCustomObjectWithKey:LoginKey];
    
    if(studented == nil){
        
        LoginViewController *viewCtr = [[LoginViewController alloc] init];
        
        viewCtr.title = @"用户登录";
        [self.navigationController pushViewController:viewCtr animated:YES];
        
        return;
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
