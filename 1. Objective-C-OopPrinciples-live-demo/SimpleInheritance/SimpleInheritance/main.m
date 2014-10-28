//
//  main.m
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Thief.h"
#import "Fighting.h"
#import "Fighter.h"
#import "Person+Fighting.h"

void heroesFight(NSArray* heroes){
    for (id<Fighting> hero in heroes) {
        [hero fight];
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [Person personWithName:@"Pesho" andAge:16];
        
        
        
    }
    return 0;
}
