//
//  ViewController.m
//  ParseLiveDemo
//
//  Created by Doncho Minkov on 10/31/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray* people;

@end

@implementation ViewController

-(instancetype)init{
    self = [super init];
    if(self){
        self.people = [NSMutableArray array];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        self.people = [NSMutableArray array];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        self.people = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName: [Person parseClassName]];

    [query orderByAscending:@"name"];
    query.skip = 2;
    query.limit = 3;
//    [query whereKey:@"name" containedIn:@[@"Doncho", @"NEW NAME", @"Gosho"]];
    
    
//    [query getObjectInBackgroundWithId:@"re1kgZi4k5" block:^(PFObject *object, NSError *error) {
//       
//        NSLog(@"%@", object);
//    }];

    __weak id weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            [weakSelf setPeople:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf tableViewPeople] reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.people.count;
}

static NSString* cellIdentifier = @"cell";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [[self.people objectAtIndex:indexPath.row] name];
    return cell;
}

@end
