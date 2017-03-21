//
//  main.m
//  LoopsNested
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        for (int i = 0; i< 10; i++) {
            for (int j = 0; j < 10; j++) {
                for (int k = 0; k < 10; k++) {
                    NSLog(@"%d%d%d", i, j, k);
                }
            }
        }
    }
    return 0;
}

