//
//  main.m
//  Functions
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray* sort(NSArray *arr){
    NSMutableArray *sorted = [NSMutableArray arrayWithArray: arr];
    for (NSInteger i = 0; i < sorted.count; i++) {
        for (NSInteger j = sorted.count -1; j>i; j--) {
            if(sorted[i] > sorted[j]){
                NSInteger swapValue = [sorted[i] integerValue];
                sorted[i] = sorted[j];
                sorted[j] = [NSNumber numberWithInteger: swapValue];
            }
        }
    }
    return sorted;
}

NSInteger sum(NSArray *arr){
    NSInteger sum = 0 ;
    for (int i = 0; i< arr.count; i++) {
        sum += [arr[i] integerValue];
    }
    return sum;
}


NSInteger  max(NSArray *numbers){
    NSInteger max = [numbers[0] integerValue];
    for (int i = 0; i < numbers.count; i++) {
        if(max < [numbers[i] integerValue]){
            max = [numbers[i] integerValue];
        }
    }
    return max;
}

NSInteger  min(NSArray *numbers){
    NSInteger min = [numbers[0] integerValue];
    for (int i = 0; i < numbers.count; i++) {
        if(min > [numbers[i] integerValue]){
            min = [numbers[i] integerValue];
        }
    }
    return min;
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        int n = 15;
        NSMutableArray *numbers = [[NSMutableArray alloc] initWithCapacity:n];
        for (int i = 0; i < n; i++) {
            [numbers addObject:[NSNumber numberWithUnsignedInteger: arc4random()%1000]];
        }
        
        NSString *numbersString = [numbers componentsJoinedByString:@", "];
        
        
        NSArray *sortedNumebers = sort(numbers);
        
        NSString *sortedNumbersString = [sortedNumebers componentsJoinedByString:@", "];
        
        NSLog(@"Original array: %@", numbersString);
        
        NSLog(@"Sorted array: %@", sortedNumbersString);
        
        NSLog(@"Their sum is: %ld", (long)sum(numbers));
        
        NSLog(@"Min number is: %ld", (long)min(numbers));
        
        NSLog(@"Max number is: %ld", (long)max(numbers));
    }
    return 0;
}

