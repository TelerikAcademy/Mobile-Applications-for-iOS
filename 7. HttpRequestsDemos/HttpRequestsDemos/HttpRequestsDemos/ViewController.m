//
//  ViewController.m
//  HttpRequestsDemos
//
//  Created by Doncho Minkov on 10/30/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDelegate>

@end

@implementation ViewController

static NSString* url = @"http://localhost:3000";

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void) loadData{
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [NSURLConnection connectionWithRequest:request delegate: self];
}

-(void) sendData{
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSString* dataString = @"{\"name\":\"Pesho\"}";
    
    NSData* reqData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:reqData];
    
    [NSURLConnection connectionWithRequest:request delegate: self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connection:(NSURLRequest*) request didReceiveData:(NSData *)data{
//    if([[request HTTPMethod] isEqualToString:@"GET"]){
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray* students = [json objectForKey: @"result"];
    
        NSMutableString* studentsListText = [NSMutableString stringWithString:@""];
        for (NSInteger i = 0; i < students.count; i++) {
            [studentsListText appendFormat:@"%@, ", [students[i] objectForKey:@"name"] ];
        }
        self.labelStudentsList.text = studentsListText;
//    }
//    else if([[request HTTPMethod] isEqualToString:@"POST"]){
//        [[[UIAlertView alloc] initWithTitle:@"Response received"
//                                    message:@"Data added to DB"
//                                   delegate:nil
//                          cancelButtonTitle:@"Ok"
//                          otherButtonTitles:nil, nil]
//         show];
//    }
}


- (IBAction)buttonLoadStudents:(id)sender {
    [self loadData];
}

- (IBAction)buttonSendData:(id)sender {
    [self sendData];
}
@end
