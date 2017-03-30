//
//  main.m
//  ObjCDemos
//
//  Created by Doncho Minkov on 3/15/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mauable.h"
#import "Animal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        id<Mauable> mauable =
            [[Animal alloc] initWithName:@"Pesho"];
        
        id<Mauable> mauable =
            [Animal animalWithName:@"Gosho"];
        
        [mauable mau]
        
    }
    
    return 0;
}
