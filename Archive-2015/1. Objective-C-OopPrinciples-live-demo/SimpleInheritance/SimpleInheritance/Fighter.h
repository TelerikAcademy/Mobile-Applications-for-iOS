//
//  Fighter.h
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h";
#import "Fighting.h";

@interface Fighter : Person<Fighting>

@property double str;

-(instancetype) initWithStr: (double) str;

@end
