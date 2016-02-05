//
//  HttpDataModel.h
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/4/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DMHttpDataModel <NSObject>

-(NSDictionary *) dict;

-(instancetype) initWithDict: (NSDictionary*) dict;

@end
