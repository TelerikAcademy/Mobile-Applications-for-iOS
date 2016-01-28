//
//  DMPhone.m
//  NavigationDemo
//
//  Created by Doncho Minkov on 1/28/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMPhone.h"

@implementation DMPhone


-(instancetype)initWithVendor:(NSString *)vendor model:(NSString *)model imageUrl:(NSString *)imageUrl andPrice:(CGFloat)price {
    if(self = [super init]) {
        self.model = model;
        self.vendor = vendor;
        self.price = price;
        self.imageUrl = imageUrl;
    }
    return self;
}


+(DMPhone *)phoneWithVendor:(NSString *)vendor model:(NSString *)model imageUrl:(NSString *)imageUrl andPrice:(CGFloat)price{
    return [[DMPhone alloc] initWithVendor:vendor model:model imageUrl:imageUrl andPrice:price];
}

@end
