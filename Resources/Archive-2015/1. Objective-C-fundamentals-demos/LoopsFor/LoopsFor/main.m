//
//  main.m
//  LoopsFor
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        int n = 10;
        for (int i = 0; i < n; i++) {
            NSLog(@"%d", i);
        }
    }
    return 0;
}

