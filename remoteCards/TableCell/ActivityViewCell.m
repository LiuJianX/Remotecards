//
//  HomeViewCell.m
//  ShowProduct
//
//  Created by lin on 14-5-22.
//  Copyright (c) 2014年 @"". All rights reserved.
//

#import "ActivityViewCell.h"
#import "News.h"
//#import "UIImageView+WebCache.h"
#import "Utils.h"
#import "Common.h"

@implementation ActivityViewCell{
   

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    
    [super awakeFromNib];
    self.headerLabel.font = HYQIHEISIZE(20);
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

/**
 *  设置新闻标题内容
 *
 *  @param model 新闻数据对象
 */
-(void)setNewsData:(News *)news{
    
    [self.headerLabel setText:news.title];
    
}


@end
