//
//  main.m
//  LoopsWhile
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSInteger base = 2;
        NSInteger power = 10;
        
        NSInteger result = 1;
        NSInteger currentPower = 0;
        
        while(currentPower < power){
            result *= base;
            currentPower++;
        }
        NSLog(@"%d^%d= %d", base, power, result);
        
    }
    return 0;
}

