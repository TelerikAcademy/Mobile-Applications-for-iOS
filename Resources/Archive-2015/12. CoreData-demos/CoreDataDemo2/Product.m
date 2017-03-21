//
//  Product.m
//  CoreDataDemo2
//
//  Created by Doncho Minkov on 11/4/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Product.h"


@implementation Product

@dynamic name;
@dynamic price;
@dynamic productInfo;
@dynamic quantityInStore;

-(instancetype) initWithName:(NSString*)pName
                      pPrice:(NSDecimalNumber*) pr
                       pInfo:(NSString*) info
                    quantity:(NSNumber*) numb

{
    self = [super init];
    if (self) {
     
        self.name = pName;
        self.price = pr;
        self.productInfo = info;
        self.quantityInStore = numb;
        
    }
    return self;

}





@end
