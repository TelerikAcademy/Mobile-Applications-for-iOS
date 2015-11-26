//
//  Person.h
//  1. UsingMethods
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

+(Person *) personWithFirstName: (NSString *) fname
                andLastName: (NSString* ) lname;

-(void) sayHello;

@end
