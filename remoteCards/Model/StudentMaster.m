//
//  StudentMaster.m
//  eCampus
//
//  Created by liujianx on 15/7/23.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "StudentMaster.h"

@implementation StudentMaster

@synthesize  employee_ID,password,name,departName,duty,position,employDate;


- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.employee_ID forKey:@"employee_ID"];
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.departName forKey:@"departName"];
    [encoder encodeObject:self.duty forKey:@"duty"];
    [encoder encodeObject:self.position forKey:@"position"]; 
    [encoder encodeObject:self.employDate forKey:@"employDate"];
    
    [encoder encodeObject:self.workId forKey:@"workId"];
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.employee_ID = [decoder decodeObjectForKey:@"employee_ID"];
        self.password = [decoder decodeObjectForKey:@"password"];
        self.departName = [decoder decodeObjectForKey:@"departName"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.duty = [decoder decodeObjectForKey:@"duty"];
        self.position = [decoder decodeObjectForKey:@"position"];
        self.employDate =  [decoder decodeObjectForKey:@"employDate"];
        self.workId =  [decoder decodeObjectForKey:@"workId"];
    }
    return  self;
}


@end
