//
//  main.m
//  Numbers
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Number types
        NSLog(@"%@ type from %d to %d", @"char", CHAR_MIN, CHAR_MAX);
        
        NSLog(@"%@ type from %d to %d", @"short", SHRT_MIN, SHRT_MAX);
        NSLog(@"%@ type from %d to %d", @"ushort", 0, USHRT_MAX);
        
        NSLog(@"%@ type from %d to %d", @"int", INT_MIN, INT_MAX);
        NSLog(@"%@ type from %d to %u", @"uint", 0, UINT32_MAX);
        
        NSLog(@"%@ type from %ld to %ld", @"long", LONG_MIN, LONG_MAX);
        NSLog(@"%@ type from %d to %lu", @"long", 0, ULONG_MAX);
        
        NSLog(@"%@ type from %lld to %lld", @"long long", LLONG_MIN, LLONG_MAX);
        NSLog(@"%@ type from %d to %llu", @"unsigned long long", 0, ULLONG_MAX);
        
        NSLog(@"%@ type from %f to %f", @"float", FLT_MIN, FLT_MAX);
        NSLog(@"%@ type from %f to %f", @"double", DBL_MIN, DBL_MAX);
        
        
        //NSNumber
        CGFloat pi = 3.14;
        NSNumber *number = [NSNumber numberWithFloat:pi];
        NSLog(@"%@", number);
    }
    return 0;
}

