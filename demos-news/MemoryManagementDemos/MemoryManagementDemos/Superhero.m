//
//  Superhero.m
//  MemoryManagementDemos
//
//  Created by Doncho Minkov on 1/26/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "Superhero.h"

@implementation Superhero

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if(self) {
        self.name = name;
    }
    return self;
}


-(Superhero *)superheroWithName:(NSString *)name    {
    return [[Superhero alloc] initWithName:name];
}

-(void)dealloc {
    NSLog(@"IN the dealloc");
}

@end
