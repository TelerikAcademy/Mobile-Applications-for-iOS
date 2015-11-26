//
//  main.m
//  SwitchCase
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int choice = 0;
        NSLog(@"please enter:");
        NSLog(@"1: sum the numbers");
        NSLog(@"2: subtract the numbers");
        NSLog(@"3: multiply the numbers");
        NSLog(@"4: divide the numbers");
        scanf("%d", &choice);
        
        int first = 0;
        int second = 0;
        
        scanf("%d", &first);
        scanf("%d", &second);
        switch (choice) {
            case 1:
            {
                NSLog(@"The sum is %d", (first + second));
            }
                break;
            case 2:
            {
                NSLog(@"The subtraction is %d", (first - second));
            }
                break;
            case 3:
            {
                
                NSLog(@"The product is %d", (first * second));
            }
                break;
            case 4:
            {
                NSLog(@"The division is %d", (first / second));
            }
                break;
            default: {
                
                NSLog(@"Wrong command");
            }
                break;
        }
    }
    return 0;
}

