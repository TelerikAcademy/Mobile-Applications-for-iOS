//
//  main.m
//  Arrays
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int n = 15;
        NSMutableArray *numbers = [[NSMutableArray alloc] initWithCapacity:n];
        for (int i = 0; i < n; i++) {
            [numbers addObject:[NSNumber numberWithUnsignedInteger: arc4random()%1000]];
        }
        
        NSString *numbersString = [numbers componentsJoinedByString:@", "];
    
        NSLog(@"Original array: %@", numbersString);
        
        for (NSInteger i = 0; i < numbers.count; i++) {
            for (NSInteger j = numbers.count -1; j>i; j--) {
                if(numbers[i] > numbers[j]){
                    NSInteger swapValue = [numbers[i] integerValue];
                    numbers[i] = numbers[j];
                    numbers[j] = [NSNumber numberWithInteger: swapValue];
                }
            }
        }
        
        NSString *sortedNumbersString = [numbers componentsJoinedByString:@", "];
        
        NSLog(@"Sorted array: %@", sortedNumbersString);
    }
    return 0;
}

