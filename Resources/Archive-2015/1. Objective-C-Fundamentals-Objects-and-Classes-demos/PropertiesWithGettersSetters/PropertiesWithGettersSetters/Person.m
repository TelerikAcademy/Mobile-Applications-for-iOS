//
//  Person.m
//  PropertiesWithGettersSetters
//
//  Created by Doncho Minkov on 2/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize firsname = _firsname;
@synthesize lastname = _lastname;
@synthesize age = _age;


- (NSString *)firsname
{
    if(!_firsname || _firsname.length == 0)
    {
        _firsname = @"John";
    }
    return _firsname;
}

- (void)setFirsname:(NSString *)firsname
{
    _firsname = firsname;
}

- (NSString *)lastname
{
    if(!_lastname || _lastname.length == 0)
    {
        _lastname = @"Doe";
    }
    return _lastname;
}

- (void)setLastname:(NSString *)lastname
{
    _lastname = lastname;
}

- (NSInteger)age
{
    if(!_age)
    {
        _age = -1;
    }
    return _age;
}

- (void)setAge:(NSInteger)age
{
    _age = age;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@ %@\nAge: %ld", self.firsname, self.lastname, self.age];
}

@end
