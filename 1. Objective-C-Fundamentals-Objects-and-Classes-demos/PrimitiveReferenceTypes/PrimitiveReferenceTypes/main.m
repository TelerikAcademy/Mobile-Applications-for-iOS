//
//  main.m
//  PrimitiveReferenceTypes
//
//  Created by Doncho Minkov on 2/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

void changeIntegerValue(NSInteger number, NSInteger newValue)
{
    number = newValue;
}


void addValue(NSMutableArray *arr, id newValue)
{
    [arr addObject:newValue];
}

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSInteger number = 5;
        NSLog(@"old value: %ld", (long)number);
        changeIntegerValue(number, 6);
        NSLog(@"new value: %ld", (long)number);
        
        
        NSMutableArray *arr = [NSMutableArray array];
        
        addValue(arr, @5);
        addValue(arr, @"string");
        
        NSLog(@"%@", arr);
    }
    return 0;
}

