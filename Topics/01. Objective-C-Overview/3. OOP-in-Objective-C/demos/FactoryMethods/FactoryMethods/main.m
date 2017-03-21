//
//  main.m
//  FactoryMethods
//
//  Created by Doncho Minkov on 2/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Person *p = [Person personWithFirstname:@"Doncho" lastname:@"Minkov" andAge:24];
        
        NSLog(@"%@", p);
    }
    return 0;
}

