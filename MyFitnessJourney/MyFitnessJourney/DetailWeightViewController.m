//
//  DetailWeightViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-19.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "DetailWeightViewController.h"

@interface DetailWeightViewController ()

@end

@implementation DetailWeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *kg = @" kg";
    
    self.weightvalue.text = [[self.weighin.weight stringValue] stringByAppendingString:kg];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate *dateforlabel = self.weighin.date;
    NSString *dater = @"Date: ";
    
    NSString *date = [dateFormat stringFromDate: dateforlabel];
    self.datevalue.text = [dater stringByAppendingString:date];
    
    if (![self.weighin.image isEqual:[NSNull null]])
        {
            NSLog(@"is image");
    self.weightimage.image = self.weighin.image;
    
    } else {
        NSLog(@"no image");
        self.nopic.hidden = NO;
        self.weightimage.hidden = YES;
    }

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
