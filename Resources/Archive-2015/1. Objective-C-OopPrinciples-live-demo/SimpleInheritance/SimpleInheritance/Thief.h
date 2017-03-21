//
//  Thief.h
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person.h"
#import "Fighting.h"

//@interface Thief : Person<Fighting>
@interface Thief: NSObject

@property int skillLevel;

-(instancetype)initWithSkillLevel:(int) skillLevel;

@end
