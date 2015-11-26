//
//  DBAccess.h
//  SQLiteDemo
//
//  Created by Doncho Minkov on 11/4/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBAccess : NSObject

+(instancetype) sharedInstance;

-(instancetype) init;
-(void) createConnection;
-(void) closeConnection;

-(NSMutableArray*) getAllProducts;

@end
