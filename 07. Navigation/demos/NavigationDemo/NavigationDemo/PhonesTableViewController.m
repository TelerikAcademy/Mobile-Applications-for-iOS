//
//  AllPhonesViewController.m
//  NavigationDemo
//
//  Created by Doncho Minkov on 1/28/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "PhonesTableViewController.h"

#import "PhoneDetailsViewController.h"
#import "AddPhoneViewController.h"

#import "AppDelegate.h"

#import "DMPhone.h"

#import "PhoneCell.h"

@interface PhonesTableViewController()<UINavigationControllerDelegate>

@end

@implementation PhonesTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Phones lists";
    
    UIBarButtonItem *addBarButton =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
     target:self
     action:@selector(showAdd)];
    
    self.navigationItem.rightBarButtonItem = addBarButton;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.phones = [delegate.data phones];
    [self.tableView reloadData];
}

-(void) showAdd {
    NSString *storyBoardId = @"addPhoneScene";
    
    AddPhoneViewController *addPhoneVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:addPhoneVC animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
    static NSString *cellIdentifier = @"phoneCell";

    UITableViewCell *originalCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(![originalCell isKindOfClass: [PhoneCell class]] ||originalCell == nil) {
        originalCell = [[[NSBundle mainBundle] loadNibNamed:@"PhoneCell" owner:nil options:nil] objectAtIndex:0];
    }
    
    PhoneCell *cell =(PhoneCell*) originalCell;
    
    DMPhone *phone = [self.phones objectAtIndex:indexPath.row];
    
    cell.modelLabel.text = phone.model;
    cell.vendorLabel.text = phone.vendor;
    
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: phone.imageUrl]]];
    
    if(img == nil) {
        img = [UIImage imageNamed:@"Batman"];
    }
    
    cell.bounds = CGRectMake(0,0, 300, 300);
    cell.cellImageView.image = img;
    cell.cellImageView.backgroundColor = [UIColor grayColor];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return self.phones.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    DMPhone *phone = [self.phones objectAtIndex:indexPath.row];
    NSString *storyBoardId = @"detailsScene";
    
    PhoneDetailsViewController *detailsVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    detailsVC.phone = phone;
    
    //         AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //    appDelegate.window.rootViewController = detailsVC;
    [self.navigationController pushViewController:detailsVC animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if( editingStyle == UITableViewCellEditingStyleDelete){
        AppDelegate* delegate = [UIApplication sharedApplication].delegate;
        [delegate.data deletePhone:[self.phones objectAtIndex:indexPath.row]];
        self.phones = [delegate.data phones];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
@end
