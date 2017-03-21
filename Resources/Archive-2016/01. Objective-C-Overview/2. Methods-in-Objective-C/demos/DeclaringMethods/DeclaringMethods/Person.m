//
//  Person.m
//  1. UsingMethods
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

+(Person *)personWithFirstName:(NSString *)fname andLastName:(NSString *)lname{
    Person *person = [[Person alloc] initWithFirstName:fname
                                           andLastName:lname]
}

-(void)sayHello{
    NSLog(@"Hello!");
}

@end
