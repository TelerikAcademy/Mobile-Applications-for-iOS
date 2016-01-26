//
//  main.m
//  ArcDemos
//
//  Created by Doncho Minkov on 1/26/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Superhero.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Superhero *hero = [Superhero superheroWithName:@"Supergirl"
                                             andPowers:@[@"Flying", @"Laser eyes", @"Super strength"]];
        
        NSLog(@"%@", hero);
    }
    return 0;
}
