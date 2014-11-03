//
//  Person.h
//  ParseLiveDemo
//
//  Created by Doncho Minkov on 10/31/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Person : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSNumber* age;

@end
