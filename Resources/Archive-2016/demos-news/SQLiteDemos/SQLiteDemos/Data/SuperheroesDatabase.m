//
//  SuperheroesDatabase.m
//  SQLiteDemos

//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "SuperheroesDatabase.h"
#import <sqlite3.h>

@implementation SuperheroesDatabase
{
    sqlite3 *_db;
}

-(instancetype)init{
    if(self = [super init]){
        NSString *sqliteDb = [[NSBundle mainBundle] pathForResource:@"Superheroes" ofType:@"db"];
        if(sqlite3_open([sqliteDb UTF8String], &_db)) {
            NSLog(@"Error!");
        }
    }
    return self;
}

-(void)dealloc {
    if(_db != nil) {
        sqlite3_close(_db);
    }
}

+(SuperheroesDatabase*) database{
    static SuperheroesDatabase* databaseInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        databaseInstance = [[SuperheroesDatabase alloc] init];
    });
    
    return databaseInstance;
}

-(NSArray*) superheroes {
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *query = @"SELECT name FROM Superheroes";
    sqlite3_stmt *statement;
    if(sqlite3_prepare(_db, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while(sqlite3_step(statement) == SQLITE_ROW) {
            //one more row in the result (statement)
            char* nameChars =(char*) sqlite3_column_text(statement, 0);
            
            NSString *name = [NSString stringWithUTF8String:nameChars];
            
            Superhero *superhero = [Superhero superheroWithName:name];
            
            [result addObject:superhero];
        }
    }
    
    return result;
}

-(void) addSuperhero: (Superhero*) superhero {
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Superheroes (name) VALUES (\"%@\")", superhero.name];
    
    sqlite3_stmt *statement;

    char* errMsg;
    
    sqlite3_prepare_v2(_db, [query UTF8String], -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE)
    {
        NSLog(@"Ok!");
    }
    else {
        NSLog(@"Not Ok!");
        NSLog(@"%@", [NSString stringWithUTF8String:errMsg]);
    }
    sqlite3_finalize(statement);
}


@end
