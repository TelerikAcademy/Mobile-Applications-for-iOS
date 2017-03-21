//
//  Person.m
//  ArcDemos
//
//  Created by Doncho Minkov on 1/26/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "Superhero.h"

@implementation Superhero


-(instancetype)initWithName:(NSString *)name andPower:(NSArray *)powers {
    if(self = [super init]){
        self.name = name;
        self.powers = [NSArray arrayWithArray:powers];
    }
    return self;
}

+(Superhero *)superheroWithName:(NSString *)name andPowers:(NSArray *)powers {
    return [[Superhero alloc] initWithName:name
                                  andPower:powers];
}

-(NSString *)description {
    NSMutableString *powersString = [NSMutableString string];
    
    __weak id weakSelf = self;
    
    [self.powers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [powersString appendString:obj];
        if(idx < [weakSelf powers].count - 1) {
            [powersString appendString:@", "];
        }
    }];
    
    return [NSString stringWithFormat:@"I am %@ and I have %@", self.name, powersString];
}

@end
