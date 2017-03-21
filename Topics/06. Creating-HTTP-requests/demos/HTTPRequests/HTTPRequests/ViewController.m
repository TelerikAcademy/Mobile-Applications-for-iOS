//
//  ViewController.m
//  HTTPRequests
//
//  Created by Doncho Minkov on 1/27/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "ViewController.h"
#import "DMHttpData.h"
#import "DMSuperhero.h"
#import "DMSuperhero+Dictionaries.h"
#import "DetailsViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) DMHttpData *http;
@property (strong, nonatomic) NSArray* superheroes;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    NSString *_url;
}

-(void)viewDidLoad {
    _url = @"http://localhost:9001/api/superheroes";
    
    [super viewDidLoad];
    
    self.title = @"The Superheroes Database";
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.http = [DMHttpData httpData];
    
    [self loadSuperheroes];
}

-(void) loadSuperheroes {
    [self.http getFrom:_url headers:nil
 withCompletionHandler:^(NSDictionary * dict, NSError *err) {
     if(err){
         NSLog(@"Error!");
         return;
     }
     NSMutableArray *superheroes = [NSMutableArray array];
     
     for (NSDictionary *superheroDict in [dict objectForKey:@"result"]){
         [superheroes addObject:[DMSuperhero superheroWithDict: superheroDict]];
     }
     self.superheroes = superheroes;
     
     dispatch_async(dispatch_get_main_queue(), ^{
         [self.tableView reloadData];
     });
 }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
        NSLog(@"NEW CELL");
    }
    cell.textLabel.text = [[self.superheroes objectAtIndex:indexPath.row] name];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    
    UIStoryboard *storyboard = self.navigationController.storyboard;
    DetailsViewController *detailsVC = [storyboard instantiateViewControllerWithIdentifier:@"details"];
    
    detailsVC.superhero = [self.superheroes objectAtIndex: indexPath.row];
    
    [self.navigationController pushViewController: detailsVC
                                         animated: YES];
    NSLog(@"%@", [self.superheroes objectAtIndex:indexPath.row]);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.superheroes.count;
}

@end
