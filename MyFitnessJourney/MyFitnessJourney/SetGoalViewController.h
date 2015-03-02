//
//  SetGoalViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-22.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SetDateViewController.h"

@interface SetGoalViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>


@property (nonatomic, retain) NSString *username;
@property (weak, nonatomic) IBOutlet UILabel *usernamelbl;
@property (weak, nonatomic) IBOutlet UIPickerView *weightpicker;
@property(retain, nonatomic) NSMutableArray *weightIntegerArray;
@property(retain, nonatomic) NSMutableArray *weightDecimalArray;

@end
