//
//  HomeViewCell.h
//  ShowProduct
//
//  Created by lin on 14-5-22.
//  Copyright (c) 2014年 @"". All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface ActivityViewCell : UITableViewCell

/**
 *  标题图片
 */
@property (retain, nonatomic) IBOutlet UIImageView *headerImageView;
/**
 * 大标题
 */
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
/**
 *  内容缩小
 */
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
/**
 *  发布时间
 */
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;


/**
 *  设置新闻标题内容
 *
 *  @param model 新闻数据对象
 */
-(void)setNewsData:(News *)model;

@property(nonatomic,strong) News *news;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;



@end
