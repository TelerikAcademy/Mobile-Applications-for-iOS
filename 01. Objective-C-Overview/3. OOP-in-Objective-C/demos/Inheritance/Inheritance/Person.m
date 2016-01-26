//
//  Person.m
//  1. Inheritance
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithFirstName:(NSString *)fname andLastName:(NSString *)lname{
    self = [super init];
    if(self){
        self.firstName = fname;
        self.lastName = lname;
    }
    return self;
}

-(void)introduce{
    NSLog(@"Hello! I am %@ %@", self.firstName, self.lastName);
}

-(void)walk{
    NSLog(@"I will just keep walking...");
}


@end
