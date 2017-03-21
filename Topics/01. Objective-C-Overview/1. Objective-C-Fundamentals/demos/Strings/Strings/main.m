//
//  main.m
//  Strings
//
//  Created by Doncho Minkov on 2/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *stringLiteral = @"String created with literal";
        NSMutableString *stringMutable = [NSMutableString stringWithString:stringLiteral];
        [stringMutable  appendString:@" and then edited"];
        NSLog(@"%@", stringLiteral);
        NSLog(@"%@", stringMutable);
        
    }
    return 0;
}

