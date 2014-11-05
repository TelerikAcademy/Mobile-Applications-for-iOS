//
//  ViewController.m
//  CoreDataDemo2
//
//  Created by Doncho Minkov on 11/4/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataHelper.h"
#import "Product.h"

@interface ViewController ()
    @property(nonatomic, strong) CoreDataHelper* cdHelper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //step 1: Insert some data
    _cdHelper = [[CoreDataHelper alloc] init];
    [_cdHelper setupCoreData];
//    
//    Product* pr1 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:_cdHelper.context];
//    pr1.name = @"Product 1";
//    pr1.productInfo = @"Product 1 is very cool product";
//    pr1.price = [NSDecimalNumber decimalNumberWithString:@"12.3"];
//    pr1.quantityInStore = @234;
//    
//    
//        Product* pr2 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:_cdHelper.context];
//
//    pr2.name = @"Product 2";
//    pr2.productInfo = @"Product 2 is very cool product";
//    pr2.price = [NSDecimalNumber decimalNumberWithString:@"132.3"];
//    pr2.quantityInStore = @34;
//    
//    [_cdHelper.context insertObject:pr1];
//    [_cdHelper.context insertObject:pr2];
//    
//    [self.cdHelper saveContext];
    
   
    
//FETHICNG:
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Product"];
    NSSortDescriptor *sort =
    [NSSortDescriptor sortDescriptorWithKey:@"price" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    NSArray *fetchedObjects = [_cdHelper.context executeFetchRequest:request error:nil];
    
    for (Product *pr in fetchedObjects) {
        NSLog(@"Fetched Object = %@", pr.name); }
    
    
//DELETE:
//    
//    NSFetchRequest *request =
//    [NSFetchRequest fetchRequestWithEntityName:@"Item"];
//    NSArray *fetchedObjects =
//    [_coreDataHelper.context executeFetchRequest:request error:nil];
//    for (Item *item in fetchedObjects) { NSLog(@"Deleting Object '%@'", item.name); [_coreDataHelper.context deleteObject:item];
//    }

    
    //step 2: fetch this data
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
