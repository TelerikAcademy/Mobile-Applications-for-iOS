//
//  main.m
//  StringConcatenation
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString *str = @"Original string";
        str = [str stringByAppendingString:@" and then appended"];
        NSLog(@"%@",str);
    }
    return 0;
}

