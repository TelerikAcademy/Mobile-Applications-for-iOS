//
//  DMSuperhero+Dictionaries.h
//  HTTPRequests
//
//  Created by Doncho Minkov on 1/27/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMSuperhero.h"

@interface DMSuperhero (Dictionaries)

-initWithDict: (NSDictionary*) dict;

+(DMSuperhero *) superheroWithDict: (NSDictionary *) dict;

-dict;


@end
