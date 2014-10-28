//
//  Person+Fighting.h
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person.h"

@interface Person (Fighting)

@property int damage;

-(int) inflictDamage;

@end
