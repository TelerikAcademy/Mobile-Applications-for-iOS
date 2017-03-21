//
//  Person.m
//  CreatingClasses
//
//  Created by Doncho Minkov on 2/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import "Person.h"

@implementation Person


-(id) init{
    
    self = [super init];
    if(self){   
        firstname = @"John";
        lastname =@"Doe";
        age = -1;
    }
    return self;
}

-(void) setFirstname:(NSString *) fname
{
    firstname = fname;
}
-(void) setLastname:(NSString *) lname
{
    lastname= lname;
    
}
-(void) setAge:(NSInteger) a
{
    age = a;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"%@ %@ is %ld-years-old", firstname, lastname, (long)age];
}
@end