//
//  Superhero.m
//  SQLiteDemos
//
//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "Superhero.h"

@implementation Superhero

-(id)initWithName:(NSString *)name {
    if(self = [super init]) {
        self.name = name;
    }
    return self;
}

+(Superhero *)superheroWithName:(NSString *)name {
    return [[Superhero alloc] initWithName:name];
}

@end
