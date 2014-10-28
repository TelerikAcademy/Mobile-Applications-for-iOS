//
//  Thief.m
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Thief.h"
#import "Person_Swimming.h"

@interface Thief(): Person

@end

@implementation Thief

-(instancetype)initWithName:(NSString *)name andAge:(int)age{
//    [[NSException exceptionWithName:@"Wrong init method" reason:@"Use the other one" userInfo:nil] raise];
    return nil;
}

-(instancetype)initWithSkillLevel:(int)skillLevel{
    if(self = [super initWithName:@"Unknown" andAge:-1]){
        self.skillLevel = skillLevel;
    }
    return self;
}

-(void)walk{
    [super walk];
    NSLog(@"The thief is walking");
}

-(NSString *)description{
    NSString* superDescription = [super description];
    return [NSString stringWithFormat:@"%@, Skill level: %d",
            superDescription,
            self.skillLevel];
    [self swim];
}

-(void)fight{
    NSLog(@"The thief is fighting");
}

@end
