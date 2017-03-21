//
//  main.m
//  LoopsDoWhile
//
//  Created by Doncho Minkov on 2/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSInteger number = 17;
        NSMutableString *reversedBinNumber = [[NSMutableString alloc]init];
        
        do{
            [reversedBinNumber appendFormat:@"%ld",number%2];
            number/=2;
        }
        while(number>0);
        
        NSMutableString *binNumber =[[NSMutableString alloc] init];
        
        for (int i = 0; i< reversedBinNumber.length; i++) {
            [binNumber appendFormat:@"%d", [reversedBinNumber characterAtIndex:i] - '0'];
        }
        
        NSLog(@"%@", binNumber);
    }
    
    return 0;
}

