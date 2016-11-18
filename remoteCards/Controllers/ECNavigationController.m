//
//  ECNavigationController.m
//  E-Campus
//
//  Created by liujianx on 15/7/20.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "ECNavigationController.h"
#import "Common.h"



@interface ECNavigationController ()

@end

@implementation ECNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 设置导航栏主题
+ (void)setupNavBarTheme
{
    // 取出 appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
//    CGFloat navBarHeight = 30.0f;
//    CGRect frame = CGRectMake(0.0f, 20.0f, 320.0f, navBarHeight);
//    [navBar setFrame:frame];
    
    // 设置背景
    if (!ios7) {
        [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleBlackOpaque;
    }
    

    
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor colorWithRed:177/255.0 green:67/255.0 blue:83/255.0 alpha:1];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont] = HYQIHEI; //[UIFont boldSystemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
}

// 设置导航栏item主题
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置背景
    if (!ios7) {
        [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = ios7 ? [UIColor redColor] : [UIColor colorWithRed:177/255.0 green:67/255.0 blue:83/255.0 alpha:1];
    
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont] = HYQIHEI; //[UIFont systemFontOfSize:ios7 ? 15 : 12];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[UITextAttributeTextColor] = [UIColor colorWithRed:177/255.0 green:67/255.0 blue:83/255.0 alpha:1];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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

@end
