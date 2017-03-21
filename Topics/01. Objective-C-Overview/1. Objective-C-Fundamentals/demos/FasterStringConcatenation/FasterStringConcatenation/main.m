//
//  main.m
//  FasterStringConcatenation
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSDate *start;
        NSDate *end;
        NSInteger repeatCount = 10000;
        NSString *repeatPattern =@"c";
        
        //Using immutable string
        
        start = [NSDate date];
        
        NSString *str = @"";
        
        for (int i = 0; i < repeatCount; i++) {
            str = [str stringByAppendingString:repeatPattern];
        }
        
        end = [NSDate date];
        NSLog(@"Appending \"%@\" %ld times using immutable string took %f seconds",
              repeatPattern,
              (long)repeatCount,
              [end timeIntervalSinceReferenceDate] - [start timeIntervalSinceReferenceDate]);
        
        //Using mutable array
        start = [NSDate date];
        
        NSMutableArray *strArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < repeatCount; i++) {
            [strArray addObject:repeatPattern];
        }
        
        end = [NSDate date];
        NSLog(@"Appending \"%@\" %ld times using mutable array took %f seconds",
              repeatPattern,
              (long)repeatCount,
              [end timeIntervalSinceReferenceDate] - [start timeIntervalSinceReferenceDate]);
        
        //Using mutable string
        start = [NSDate date];
        
        NSMutableString *mutableStr = [[NSMutableString alloc] init];
        
        for (int i = 0; i < repeatCount; i++) {
            [mutableStr appendString:repeatPattern];
        }
        
        end = [NSDate date];
        NSLog(@"Appending \"%@\" %ld times using mutable string took %f seconds",
              repeatPattern,
              (long)repeatCount,
              [end timeIntervalSinceReferenceDate] - [start timeIntervalSinceReferenceDate]);
    }
    return 0;
}

