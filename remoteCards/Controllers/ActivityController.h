//
//  ActivityController.h
//  eCampus
//
//  Created by liujianx on 15/8/19.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMaster.h"

@interface ActivityController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    StudentMaster *studented;

}
@end
