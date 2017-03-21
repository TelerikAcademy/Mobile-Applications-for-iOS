//
//  Person.h
//  CreatingClasses
//
//  Created by Doncho Minkov on 2/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *firstname;
    NSString *lastname;
    NSInteger age;
}

-(void) setFirstname:(NSString *) fname;
-(void) setLastname:(NSString *) lname;
-(void) setAge:(NSInteger) a;



@end
