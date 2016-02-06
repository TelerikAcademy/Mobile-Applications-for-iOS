//
//  HttpData.h
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/4/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DMHttpDataModel.h"

@interface DMHttpData : NSObject

+(DMHttpData*) httpData;

-(void) getFrom: (NSString*) urlStr
        withHeaders: (NSDictionary *) headersDict
withCompletionHandler: (void(^)(NSDictionary*, NSError*)) completionHandler;

-(void) postAt: (NSString*) urlStr
      withBody: (id<DMHttpDataModel>) bodyDict
       headers: (NSDictionary *) headersDict
andCompletionHandler: (void(^)(NSDictionary*, NSError*)) completionHandler;

-(void) deleteFrom: (NSString*) urlStr
        withHeaders: (NSDictionary *) headersDict
withCompletionHandler: (void(^)(NSDictionary*, NSError*)) completionHandler;

-(void) putAt: (NSString*) urlStr
      withBody: (id<DMHttpDataModel>) bodyDict
       headers: (NSDictionary *) headersDict
andCompletionHandler: (void(^)(NSDictionary*, NSError*)) completionHandler;

@end
