//
//  CardRecordCell.h
//  remoteCards
//
//  Created by liujianxiong on 2017/6/24.
//  Copyright © 2017年 esquel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CadRecordModel.h"

@interface CardRecordCell : UITableViewCell
@property (strong, nonatomic)  UILabel *lblDate;
@property (nonatomic,strong) UILabel *lblCardType;
@property (nonatomic,strong) UILabel *lblMsg;

- (void)setData:(CadRecordModel *)model;

@property (nonatomic, strong) CadRecordModel *cardRecord;

@end
