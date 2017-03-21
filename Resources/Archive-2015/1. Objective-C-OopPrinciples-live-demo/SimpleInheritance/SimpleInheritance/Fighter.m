//
//  Fighter.m
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Fighter.h"

@implementation Fighter

-(instancetype)initWithStr:(double)str{
    if(self = [super init]){
        self.str = str;
    }
    return self;
}

-(void)fight{
    NSLog(@"The fighter is fighting with strength of %lf", self.str);
}


@end
