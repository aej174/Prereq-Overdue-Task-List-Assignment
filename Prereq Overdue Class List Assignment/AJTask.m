//
//  AJTask.m
//  Prereq Overdue Class List Assignment
//
//  Created by Allan Jones on 5/16/14.
//  Copyright (c) 2014 Allan Jones. All rights reserved.
//

#import "AJTask.h"


@implementation AJTask

- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {   self.title = data[TASK_TITLE];
        self.description = data[TASK_DESCRIPTION];
        self.date = data[TASK_DATE];
        self.isCompleted = [data[TASK_COMPLETION] boolValue];
    }
    return self;
}

-(id)init
{
    self = [self initWithData:nil];
    return self;
}

@end
