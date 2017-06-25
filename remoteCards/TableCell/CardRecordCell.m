//
//  CardRecordCell.m
//  remoteCards
//
//  Created by liujianxiong on 2017/6/24.
//  Copyright © 2017年 esquel. All rights reserved.
//

#import "CardRecordCell.h"
#import "Utils.h"
#import "Common.h"
#import "CadRecordModel.h"

@implementation CardRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];

      [self initControl];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initControl{
    
    NSInteger y = 8,h = 25;
    CGFloat w = [Utils getScreenWidth] / 3;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(8, y, w, h)];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view1.bounds.size.height)];
    
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"日期:";
    [view1 addSubview:lbl];
    
    _lblDate = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view1.bounds.size.width , view1.bounds.size.height)];
    _lblDate.font = HYQIHEISIZE(14);
    [view1 addSubview:_lblDate];
    
    
    [self addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(8 + w, y, w, h)];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, view2.bounds.size.height)];
    lbl.font = HYQIHEISIZE(12);
    lbl.text = @"班别:";
    [view2 addSubview:lbl];
    
    
    _lblCardType = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view2.bounds.size.width , view2.bounds.size.height)];
    _lblCardType.font = HYQIHEISIZE(14);
    [view2 addSubview:_lblCardType];
    
    [self addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(8 + w + w, y, w, h)];
    
    _lblMsg = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, view3.bounds.size.width , view3.bounds.size.height)];
    _lblMsg.font = HYQIHEISIZE(14);
    [view3 addSubview:_lblMsg];
    
    [self addSubview:view3];
    
}
- (void)setData:(CadRecordModel *)model{
    _lblDate.text = model.cardDate;
    _lblCardType.text = model.cardType;
    _lblMsg.text = model.msg;
    
    //_lbltDate.text = news.tDate;
    //  _lblEmp_ID.text = news.emp_ID;

}

@end
