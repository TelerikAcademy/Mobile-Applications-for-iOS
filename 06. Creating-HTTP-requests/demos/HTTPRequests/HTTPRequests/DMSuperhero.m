//
//  DMSuperhero.m
//  HTTPRequests
//
//  Created by Doncho Minkov on 1/27/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMSuperhero.h"

@implementation DMSuperhero


-(instancetype)initWithName:(NSString *)name andPowers:(NSArray *)powers {
    if(self = [super init]){
        self.name = name;
        self.powers = [NSArray arrayWithArray:powers];
    }
    return self;
}

+(DMSuperhero *)superheroWithName:(NSString *)name andPowers:(NSArray *)powers  {
    return [[DMSuperhero alloc]initWithName:name
                                  andPowers:powers];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@", self.name];
}

@end
