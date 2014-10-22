//
//  Person.m
//  1. UsingMethods
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person.h"

@implementation Person

+(Person *)personWithFirstName:(NSString *)fname andLastName:(NSString *)lname{
    Person *person = [[Person alloc] init];
    person.firstName = fname;
    person.lastName = lname;
    
    return person;
}

-(void)sayHello{
    NSLog(@"Hello!");
}

@end
