//
//  MainViewController.m
//  iOSArchitectureDemos
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController{
    NSArray* names;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    names = [NSArray arrayWithObjects:@"Ivancho", @"Mariika", nil];
    
    [self.tableView setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    segue destinationViewController
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (IBAction)buttonTap:(id)sender {
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"You have a message" message:@"Hello there" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [view show];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"tableViewCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = names[indexPath.row];
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return names.count;
}






@end
