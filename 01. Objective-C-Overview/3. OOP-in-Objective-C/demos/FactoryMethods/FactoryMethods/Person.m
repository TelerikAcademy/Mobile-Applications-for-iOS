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


- (id)init
{
    self = [super init];
    if(self)
    {
        //initialization code
    }
    return self;
}

- (id)initWithFirstname:(NSString *)fname
            andLastname:(NSString *)lname
{
    self = [super init];
    if(self)
    {
        self.firsname = fname;
        self.lastname = lname;
    }
    
    return self;
}

- (id)initWithFirstname:(NSString *)fname
            lastname:(NSString *)lname
                 andAge:(NSInteger)a
{
    self = [super init];
    if(self)
    {
        self.firsname = fname;
        self.lastname = lname;
        self.age = a;
    }
    
    return self;
}

+ (Person *)person
{
    return [[Person alloc] init];
}

+ (Person *)personWithFirstname:(NSString *)fname andLastname:(NSString *)lname
{
    return [[Person alloc] initWithFirstname:fname andLastname:lname];
}

+(Person *)personWithFirstname:(NSString *)fname lastname:(NSString *)lname andAge:(NSInteger)a
{
    return [[Person alloc] initWithFirstname:fname lastname:lname andAge:a];
}

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
