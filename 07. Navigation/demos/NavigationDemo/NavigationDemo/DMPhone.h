//
//  DMPhone.h
//  NavigationDemo
//
//  Created by Doncho Minkov on 1/28/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DMPhone : NSObject

@property (strong, nonatomic) NSString *vendor;
@property (strong, nonatomic) NSString *model;

@property (strong, nonatomic) NSString *imageUrl;

@property CGFloat price;


-(instancetype)initWithVendor: (NSString*) vendor
                        model:(NSString*) model
                     imageUrl: (NSString*) imageUrl
                     andPrice: (CGFloat) price;

+(DMPhone*) phoneWithVendor: (NSString*) vendor
                      model:(NSString*) model
                   imageUrl: (NSString*) imageUrl
                   andPrice: (CGFloat) price;

@end
