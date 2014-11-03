//
//  TALocationProvider.h
//  WorkingWithLocation
//
//  Created by Doncho Minkov on 11/3/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TALocationProvider : NSObject

-(void) getLocationWithBlock: (void(^)(CLLocation* location)) block;

-(void) getLocationWithTarget:(id) target
                              andAction:(SEL) action;

@end
