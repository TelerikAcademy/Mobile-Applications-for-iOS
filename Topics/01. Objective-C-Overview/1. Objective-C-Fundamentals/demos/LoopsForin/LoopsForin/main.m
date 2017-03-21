//
//  main.m
//  LoopsForin
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *numberStrings = @[@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten"];
        for (NSNumber *numberStr in numberStrings) {
            NSLog(@"%@", numberStr);
        }
    }
    return 0;
}

