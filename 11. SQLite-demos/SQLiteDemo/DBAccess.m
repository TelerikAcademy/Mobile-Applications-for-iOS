//
//  DBAccess.m
//  SQLiteDemo
//
//  Created by Doncho Minkov on 11/4/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "DBAccess.h"
#import "sqlite3.h"
#import "Products.h"

@implementation DBAccess{
    sqlite3* _database;
}

+(instancetype) sharedInstance
{
    static DBAccess* _instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance  = [[DBAccess alloc] init];
    });

    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createConnection];
    }
    return self;
}

#pragma mark DBConnection methods

-(void) createConnection{
    // Get the database from the application bundle.
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:@"products"
                      ofType:@"sqlite"];
    
    // Open the database.
    if (sqlite3_open([path UTF8String], &_database) == SQLITE_OK)
    {
        NSLog(@"Opening Database");
    }
    else
    {
        [self closeConnection];
    }
}

-(void) closeConnection{
    // Close the database.
    if (sqlite3_close(_database) != SQLITE_OK) {
        NSAssert1(0, @"Error: failed to close database: ‘%s’.",
                  sqlite3_errmsg(_database));
    }
   
}

#pragma mark CRUD operations

-(NSMutableArray*) getAllProducts
{
    //  The array of products that we will create
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    //  The SQL statement that we plan on executing against the database
    const char *sql = "SELECT product.ID,product.Name,product.details,product.price,product.quantityonstock FROM Product where product.ID > ?";
   
    //  The SQLite statement object that will hold our result set
    sqlite3_stmt *statement;
    
    // Prepare the statement to compile the SQL query into byte-code
    int sqlResult = sqlite3_prepare_v2(_database, sql, -1, &statement, NULL);
    
    
    sqlite3_bind_int(statement, 1, 10);
    
    if ( sqlResult== SQLITE_OK) {
        // Step through the results - once for each row.
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //  allocate a Product object to add to products array
            Products  *product = [[Products alloc] init];
            // The second parameter is the column index (0 based) in
            // the result set.
            char *name = (char *)sqlite3_column_text(statement, 1);
            char *details = (char *)sqlite3_column_text(statement, 2);
            double price = sqlite3_column_double(statement, 3);
            int quantity = sqlite3_column_int(statement, 4);
            
            //  Set all the attributes of the product
            product.productID = sqlite3_column_int(statement, 0);
            product.name = (name) ? [NSString stringWithUTF8String:name] : @"";
//            product.manufacturer = (manufacturer) ? [NSString
//                                                     stringWithUTF8String:manufacturer] : @"";
            product.details = (details) ? [NSString stringWithUTF8String:details] : @"";
            
            product.price = price;
            product.quantityInStock = quantity;
            
            // Add the product to the products array
            [products addObject:product];
            
        }
        // finalize the statement to release its resources
        sqlite3_finalize(statement);
    }
    else {
        NSLog(@"Problem with the database:");
        NSLog(@"%d",sqlResult);
    }
    
    return products;
}



















@end
