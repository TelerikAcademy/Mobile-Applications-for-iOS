//
//  Person.m
//  PropertiesGettersSetters
//
//  Created by Doncho Minkov on 2/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize firstname = _firstname;
@synthesize lastname = _lastname;
@synthesize age = _age;


- (void)setFirstname:(NSString *)firstname
{
    _firstname = firstname;
}

- (NSString *)firstname
{
    if(!_lastname || _lastname.length == 0)
    {
        _lastname = @"John";
    }
    
    return _firstname;
}

- (void)setLastname:(NSString *)lastname
{
    _lastname = lastname;
}

- (NSString *)lastname
{
    if(!_lastname || _lastname.length == 0)
    {
        _lastname = @"Doe";
    }
    return _lastname;
}


- (void)setAge:(NSInteger)age
{
    _age = age;
}

- (NSInteger)age
{
    if(!_age)
    {
        _age = -1;
    }
    return _age;
}

@end