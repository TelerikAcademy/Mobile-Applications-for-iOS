//
//  LocalData.h
//  NavigationDemo
//
//  Created by Doncho Minkov on 1/28/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved
//

#import <Foundation/Foundation.h>
#import "DMPhone.h"

@interface LocalData : NSObject


-(NSArray*) phones;

-(void) addPhone: (DMPhone *) phone;

-(void) deletePhone: (DMPhone *) phone;

@end
