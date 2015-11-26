//
//  Person+Fighting.m
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person+Fighting.h"

@implementation Person (Fighting)

-(int)inflictDamage{
    NSLog(@"%@ is inflicting damage", self.name);
    return 0;
}

@end
