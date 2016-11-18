//
//  TabBarController.h
//  eCampus
//
//  Created by liujianx on 15/8/18.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMaster.h"
//#import "EAIntroView.h"
#import "WBTabBar.h"

@interface TabBarController : UITabBarController<WBTabbarDekegate,UIScrollViewDelegate>{
    
    StudentMaster *studented;
}


@property (assign ,nonatomic) BOOL isPush;

@end
