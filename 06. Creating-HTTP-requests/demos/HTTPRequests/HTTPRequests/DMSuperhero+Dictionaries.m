//
//  DMSuperhero+Dictionaries.m
//  HTTPRequests
//
//  Created by Doncho Minkov on 1/27/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMSuperhero+Dictionaries.h"

@implementation DMSuperhero (Dictionaries)

-(id)initWithDict:(NSDictionary *)dict  {
    return [self initWithName:[dict objectForKey:@"name"]
andPowers:[dict objectForKey:@"powers"]];
}

-(id)dict {
    return @{
             @"name": self.name,
             @"powers": self.powers
            };
}

+(DMSuperhero *)superheroWithDict:(NSDictionary *)dict {
    return [[DMSuperhero alloc] initWithDict:dict];
}


@end
