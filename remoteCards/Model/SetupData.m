//
//  StudentMaster.m
//  eCampus
//
//  Created by liujianx on 15/7/23.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "SetupData.h"

@implementation SetupData

@synthesize isPush;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeBool: self.isPush forKey:@"isPush"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
       self.isPush = [decoder decodeBoolForKey:@"isPush"];
        
    }
    return  self;
}


@end
