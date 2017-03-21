//
//  ViewController.m
//  SQLiteDemos
//#0	0x0000000108f83236 in -[ViewController viewDidLoad] at /Users/minkov/Desktop/demos/SQLiteDemos/SQLiteDemos/ViewController.m:22

//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "SuperheroesTableViewController.h"

#import "SuperheroesDatabase.h"
#import "Superhero.h"

@interface SuperheroesTableViewController ()

@property (strong, nonatomic) NSArray *superheroes;

@end

@implementation SuperheroesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Superheroes Database!";
    [self.tableView registerClass: UITableViewCell.self forCellReuseIdentifier:@"SuperheroCell"];
    
    UIBarButtonItem *btnShowAddAlertVC = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                       target:self
                                                                                       action: @selector(showAddVC)];
    
    self.navigationItem.rightBarButtonItem = btnShowAddAlertVC;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.superheroes = [[SuperheroesDatabase database] superheroes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showAddVC {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add Superhero"
                                                                             message:@"Add name of your superhero"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Name";
    }];
    
    __weak id weakSelf = self;
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action)
                                 {
                                     NSString *name = alertController.textFields[0].text;
                                     [[SuperheroesDatabase database] addSuperhero:[Superhero superheroWithName:name]];
                                     self.superheroes  = [[SuperheroesDatabase database] superheroes];
                                     [[weakSelf tableView] reloadData];
                                 }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                         }];
    
    [alertController addAction: cancelAction];
    [alertController addAction: saveAction];
    
    [self presentViewController:alertController animated:YES completion: nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuperheroCell"];
    
    cell.textLabel.text = [[self.superheroes objectAtIndex: indexPath.row] name];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return self.superheroes.count;
}

@end
