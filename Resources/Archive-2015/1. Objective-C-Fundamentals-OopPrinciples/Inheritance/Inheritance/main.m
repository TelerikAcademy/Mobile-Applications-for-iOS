//
//  main.m
//  Inheritance
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Ninja.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *people = @[
                            [[Person alloc] initWithFirstName: @"Doncho" andLastName: @"Minkov"],
                            [[Ninja alloc] initWithRank:10],
                            [[Ninja alloc] initWithFirstName: @"Peter" andLastName: @"Petrov"]
                            ];
        for (Person *p in people) {
            [p introduce];
        }
    }
    
    return 0;
}
