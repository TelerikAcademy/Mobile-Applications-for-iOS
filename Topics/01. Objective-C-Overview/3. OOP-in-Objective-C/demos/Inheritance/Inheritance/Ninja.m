//
//  Ninja.m
//  1. Inheritance
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Ninja.h"

@implementation Ninja

const int POWER_FOR_RANK_POINT = 15;
const int DEFAULT_NINJA_RANK = 1;

-(instancetype)initWithRank:(int)rank{
    self = [super initWithFirstName:@"Unknown"
                        andLastName:@"Unknown"];
    if(self){
        self.rank = rank;
    }
    return self;
}

-(instancetype) initWithFirstName:(NSString *)fname
                      andLastName:(NSString *)lname{
    return [self initWithRank:DEFAULT_NINJA_RANK];
}

-(void)fight{
    NSLog(@"The ninja hits with power %d", self.rank * POWER_FOR_RANK_POINT);
}

@end
