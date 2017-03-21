//
//  Resizable.h
//  2. Protocols
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Resizable <NSObject>

@property double width;
@property double height;

-(void) resizeWidth: (double) width;
-(void) resizeHeight: (double) height;
-(void) resizeWidth: (double) width
          andHeight: (double) height;

@end
