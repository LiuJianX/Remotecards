//
//  TabBarController.m
//  eCampus
//
//  Created by liujianx on 15/8/18.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "TabBarController.h"
#import "CSStickyHeaderFlowLayout.h"
#import "ECNavigationController.h"
#import "Common.h"
#import "UIImage+WB.h"
#import "HomeController.h" 
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "SetupData.h"

@interface TabBarController (){
    
    NSInteger tabIndex ;
    
}

@property (nonatomic, weak) WBTabBar *customTabBar;
@property(nonatomic,weak) HomeController *homeCtr ;
@end

@implementation TabBarController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    [Utils setScreenWidth:self.view.self.bounds.size.width];
    
    [Utils setScreenHeight:self.view.self.bounds.size.height];
   
    @try {
         
        // 初始化tabbar
        [self setupTabBar];
        // 初始化所以子控制器
        [self setupAllChildViewControls];
        
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
    
}


// tabbar代理方法 点击了哪个
- (void)tabBar:(WBTabBar *)tabBar didSelectedButtonfrom:(NSInteger)from to:(NSInteger)to{
    
    @try{
        studented = [Utils loadCustomObjectWithKey:LoginKey];
        
        if (to == 1  || to == 2) { // 点击更多
            if(studented == nil){
                [Utils showMBAllTextDialog:@"亲,该功能必须先进行登录哦." view:self.view];
                return;
            }
            
        }
        
        self.selectedIndex = to;
        
    } @catch (NSException *exception) {
        [Utils showAllTextDialog:[NSString stringWithFormat:@"切换页面发生错误,原因:%@",exception]];
        
    }@finally{
        
    }
}




- (void)setupTabBar
{
    WBTabBar *customTabBar = [[WBTabBar alloc]init];
    customTabBar.delegate = self;
    customTabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    self.tabBar.selectedImageTintColor = NavFontColor; //ENavBgColor;
    
    
}


- (void)setupAllChildViewControls
{
    // 首页控制器
    // 创建布局
    CSStickyHeaderFlowLayout *layout = [[CSStickyHeaderFlowLayout alloc]init];
    // 设置cell尺寸
    layout.itemSize = CGSizeMake(80, 80);
    // 设置水平间距
    layout.minimumInteritemSpacing = 0;
    // 设置垂直间距
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    layout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 170);
    layout.headerReferenceSize = CGSizeMake(200, 80);
    
    
    
    //设置NavigationBar背景颜色  方案1. by ljx
    [[UINavigationBar appearance] setBarTintColor:NavFontColor];
    //@{}代表Dictionary
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:HYQIHEISIZE(18)}];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
 
    
    HomeController *homeCtr = [[HomeController alloc] initWithCollectionViewLayout:layout];
    
    [self addChildViewControl:homeCtr title:@"主页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home"];
    self.homeCtr = homeCtr;

}


/**
 *  添加子控制器
 *
 *  @param childVc           子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 被选中图片
 */
- (void)addChildViewControl:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题图片
    childVc.title = title;

    
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    if (ios7) {
        childVc.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName]
                                            imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }else {
        childVc.tabBarItem.selectedImage = [UIImage imageWithName:selectedImageName];
    }
    
    // 添加到导航控制器
    ECNavigationController *childVcNav = [[ECNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:childVcNav];
    // 添加自定义item
    [self.customTabBar addButtonWithItem:childVc.tabBarItem];
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
