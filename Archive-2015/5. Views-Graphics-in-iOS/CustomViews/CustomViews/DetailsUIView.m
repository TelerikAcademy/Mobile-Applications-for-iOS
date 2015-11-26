//
//  DetailsUIView.m
//  CustomViews
//
//  Created by Doncho Minkov on 10/29/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "DetailsUIView.h"

@implementation DetailsUIView

-(void)awakeFromNib{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"hh:mm:ss"];
    
    self.labelMessage.text =[NSString stringWithFormat:@"Loaded at %@",
                      [f stringFromDate:[NSDate date]]];
}

@end
