//
//  DMSuperhero.m
//  ParseDemos
//
//  Created by Doncho Minkov on 2/1/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMSuperhero.h"

@implementation DMSuperhero

@synthesize name = _name;

+(void)load {
    [self registerSubclass];
}

+(NSString *)parseClassName {
    return @"Superhero";
}

-(NSString *)name {
    return self[@"name"];
}

-(void)setName:(NSString *)name {
    self[@"name"] = name;
}


+(DMSuperhero *)superheroWithName:(NSString *)name   {
    DMSuperhero *hero = [DMSuperhero object];
    hero.name = name;
    return hero;
}


@end
