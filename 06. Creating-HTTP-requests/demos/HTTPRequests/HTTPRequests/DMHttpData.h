//
//  DMHttpData.h
//  HTTPRequests
//
//  Created by Doncho Minkov on 1/27/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMHttpData : NSObject

-(void) getFrom: (NSString*) urlStr
        headers: (NSDictionary*) headersDict
withCompletionHandler: (void(^)(NSDictionary*, NSError*)) completionHandler;

-(void) postAt: (NSString*) urlStr
      withBody: (NSDictionary*) bodyDict
       headers: (NSDictionary*) headersDict
andCompletionHandler: (void(^)(NSDictionary*, NSError*)) completionHandler;

+(DMHttpData*)httpData;

@end
