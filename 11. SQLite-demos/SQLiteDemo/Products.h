//
//  Products.h
//  SQLiteDemo
//
//  Created by Doncho Minkov on 11/4/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject

@property int productID;
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* details;
@property double price;
@property int quantityInStock;

@property (nonatomic, strong) NSString* manufacturerName;

@end
