//
//  SuperheroesDatabase.h
//  SQLiteDemos
//
//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Superhero.h"

@interface SuperheroesDatabase : NSObject

+(SuperheroesDatabase*) database;

-(NSArray*) superheroes;
-(void) addSuperhero: (Superhero*) superhero;

@end
