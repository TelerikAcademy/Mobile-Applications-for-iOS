//
//  ViewController.m
//  CustomUITableViewCells
//
//  Created by Doncho Minkov on 10/29/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import "PrototypeUITableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

static NSInteger count = 100;
static NSString* cellIdentifier = @"PrototypeUITableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib* nib = [UINib nibWithNibName:cellIdentifier
                                bundle:nil];
    
    [self.tableView registerNib:nib
         forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PrototypeUITableViewCell *cell =
    [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item #%ld", indexPath.row];
    
    cell.textLabel.textColor = [UIColor blueColor];
    cell.backgroundColor = [UIColor clearColor];
    if(indexPath.row == 5){
        cell.backgroundColor = [UIColor redColor];
    }
    else if (indexPath.row == 7){
        cell.backgroundColor = [UIColor greenColor];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return count;
}


@end
