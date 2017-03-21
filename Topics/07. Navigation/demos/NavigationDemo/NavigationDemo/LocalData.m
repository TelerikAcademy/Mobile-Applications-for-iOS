//
//  LocalData.m
//  NavigationDemo
//
//  Created by Doncho Minkov on 1/28/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "LocalData.h"


@interface LocalData()

@property NSMutableArray *_phones;

@end

@implementation LocalData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self._phones = [NSMutableArray array];
    }
    return self;
}

-(NSArray*) phones {
    return [NSArray arrayWithArray:self._phones];
}

-(void)addPhone:(DMPhone *)phone {
    [self._phones addObject: phone];
}

-(void)deletePhone:(DMPhone *)phone {
    NSInteger index = [self._phones indexOfObject:phone];
    [self._phones removeObjectAtIndex:index];
}

@end
