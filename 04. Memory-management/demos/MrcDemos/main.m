//
//  main.m
//  MemoryManagementDemos
//
//  Created by Doncho Minkov on 10/28/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person *personWithInit = [[Person alloc] initWithName: @"Test Init Person"];
        Person *person = [[Person personWithName: @"Test Factory Person"] retain];
        
        //call to methods
        //send to objects
            //can take ownership of person
        
        [person release];
    }
    return 0;
}
