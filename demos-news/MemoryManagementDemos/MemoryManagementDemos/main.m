//
//  main.m
//  MemoryManagementDemos
//
//  Created by Doncho Minkov on 1/26/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Superhero.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        __weak NSString *name = @"John";
        NSLog(@"%@", name);
    };
    
    return 0;
}
