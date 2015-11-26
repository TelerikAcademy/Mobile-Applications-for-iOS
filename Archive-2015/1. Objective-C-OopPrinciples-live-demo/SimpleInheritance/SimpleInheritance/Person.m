//
//  Person.m
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person.h"
#import "Person_Swimming.h"

@interface Person()

@property (strong, nonatomic) NSString* name;
@property int personId;

@end

@implementation Person{
    double lastId;
}

int lastId;

-(instancetype) init{
    return [self initWithName:@"" andAge:0];
}

-(instancetype)initWithName:(NSString *)name andAge:(int)age{
    if(self = [super init]){
        self.name = name;
        self.age = age;
        lastId = [[NSDate date] timeIntervalSinceNow];
        self.personId = ++lastId;
        
    }
    return self;
}

+(Person *)personWithName:(NSString *)name andAge:(int)age{
    return [[Person alloc] initWithName:name andAge:age];
}

-(void)walk{
    NSLog(@"The person %@ is walking",
          self.name);
}

-(void) birthday{
    ++self.age;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Name: %@, Age: %d, Id: %d",
            self.name,
            self.age,
            self.personId];
}

-(void)swim{
    NSLog(@"%@ is swimming", self.name);
}

@end
