//
//  Product.h
//  CoreDataDemo2
//
//  Created by Doncho Minkov on 11/4/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) NSString * productInfo;
@property (nonatomic, retain) NSNumber * quantityInStore;

-(instancetype) initWithName:(NSString*)pName
                      pPrice:(NSDecimalNumber*) pr
                       pInfo:(NSString*) info
                    quantity:(NSNumber*) numb;
@end
