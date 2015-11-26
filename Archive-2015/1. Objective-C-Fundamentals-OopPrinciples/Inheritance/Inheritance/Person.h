//
//  Person.h
//  1. Inheritance
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

-(instancetype) initWithFirstName: (NSString *) fname
                      andLastName: (NSString *) lname;
-(void) introduce;
-(void) walk;

@end
