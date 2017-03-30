//
//  Animal.m
//  ObjCDemos
//
//  Created by Doncho Minkov on 3/15/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

#import "Animal.h"

@interface Animal ()
    @property NSString* name;
@end

@implementation Animal

-(Animal *)init {
    return [self initWithName:@"[Unknown]"];
}

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if(self) {
        self.name = name;
    }
    return self;
}

-(void)mau{
    NSLog(@"%@", @"Mau");
}

+(Animal *)animalWithName:(NSString *)name {
    return [[Animal alloc] initWithName:name];
}

@end
