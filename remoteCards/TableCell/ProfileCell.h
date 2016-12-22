//
//  ProfileCell.h
//  remoteCards
//
//  Created by liujianxiong on 2016/11/16.
//  Copyright © 2016年 esquel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileCell : UITableViewCell

typedef void(^selectedAddressJob)(ProfileCell *);
@property (strong, nonatomic) selectedAddressJob selectAddressJobBlock;

typedef void(^buttonUpdatePwd)(ProfileCell *);
@property (strong, nonatomic) buttonUpdatePwd buttonUpdatePwdBlock;



typedef void(^buttonTest)(ProfileCell *);
@property (strong, nonatomic) buttonTest buttonTestBlock;

@property (nonatomic,strong) UILabel *lblEmp_ID;
@property (nonatomic,strong) UILabel *lblName;
@property (nonatomic,strong) UILabel *lbltDate;
@property (nonatomic,strong) UILabel *lblDepartName;
@property (nonatomic,strong) UILabel *lblDuty;
@property (nonatomic,strong) UILabel *lblPosition;
@property (nonatomic,strong) UILabel *lblVer;

@property (strong, nonatomic)   UIImageView *imgCode;
@property (strong, nonatomic)  UILabel *lblTip;
@end
