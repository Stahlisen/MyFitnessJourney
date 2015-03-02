//
//  SetGoalViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-22.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "SetGoalViewController.h"

@interface SetGoalViewController ()

@end

@implementation SetGoalViewController

@synthesize username;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Set labeltext to username
    self.usernamelbl.text = self.username;
    
    //Allocate and initiate arrays as datasource for UIPickerview
    self.weightIntegerArray = [[NSMutableArray alloc] init];
    self.weightDecimalArray = [[NSMutableArray alloc] init];
    
    //Initiate values in arrays
    [self addArrayContent];
    
    self.weightpicker.delegate = self;
    self.weightpicker.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void) addArrayContent {
    
    //Add values from 0-200 to IntegerArray
    for( int i = 0; i < 201; ++i )
    {
        NSString *strVal = [NSString stringWithFormat:@"%d", i];
        [self.weightIntegerArray addObject:strVal];
        
    }
    //Add decimals ,1-,9 to DecimalArray
    [self.weightDecimalArray addObject:@".0"];
    [self.weightDecimalArray addObject:@".1"];
    [self.weightDecimalArray addObject:@".2"];
    [self.weightDecimalArray addObject:@".3"];
    [self.weightDecimalArray addObject:@".4"];
    [self.weightDecimalArray addObject:@".5"];
    [self.weightDecimalArray addObject:@".6"];
    [self.weightDecimalArray addObject:@".7"];
    [self.weightDecimalArray addObject:@".8"];
    [self.weightDecimalArray addObject:@".9"];

}

//Delegates for pickerview

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent :(NSInteger)component
{
    
    if (component==0)
    {
        return [self.weightIntegerArray count];
    }
    else
    {
        return [self.weightDecimalArray count];
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component)
    {
           
        case 0:
            return [self.weightIntegerArray objectAtIndex:row];
            break;
        case 1:
            return [self.weightDecimalArray objectAtIndex:row];
            break;
    }
    return nil;
}


//Gets the selected weight from UIPickerView and returns the value as float
- (float) getSelectedWeight {
    
    NSString *weightInteger = [NSString stringWithFormat:@"%@",[self.weightIntegerArray objectAtIndex:[_weightpicker selectedRowInComponent:0]]];
    NSString *weightDecimal = [NSString stringWithFormat:@"%@",[self.weightDecimalArray objectAtIndex:[_weightpicker selectedRowInComponent:1]]];
    
    float weightint = [weightInteger floatValue];
    float weightdecimal = [weightDecimal floatValue];
    float goalweight = weightint+weightdecimal;
    NSLog(@"%.2F", goalweight);
    
    NSString* ids = [PFUser currentUser].objectId;
    
    NSLog(@"%@", ids);
    
    return goalweight;
}

//Saves the entered goalweight to the current user Goal association
- (IBAction)registerGoalWeight:(id)sender {
    
    PFUser *user = [PFUser currentUser];
    
    float gw = [self getSelectedWeight];

    //Initiate NSNumber for Parse database weight format
    NSNumber* numberweight = [NSNumber numberWithFloat:gw];
    
    // Creates the goal
    PFObject *goal = [PFObject objectWithClassName:@"Goal"];
    goal[@"weight"] = numberweight;
    goal[@"user"] = user;
    [goal saveInBackgroundWithBlock:nil];
    
    
    
    // Find goal weight for currentuser
    PFQuery *query = [PFQuery queryWithClassName:@"Goal"];
    [query whereKey:@"user" equalTo:user];
    NSArray *usersGoal = [query findObjects];
    
    NSLog(@"%@", [usersGoal[0] objectForKey:@"weight"]);
    
    [self performSegueWithIdentifier:@"showSetDate" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"showSetDate"]) {
        
        
        SetDateViewController *setDate = (SetDateViewController*)segue.destinationViewController;
    } else {
        
        NSLog(@"Other identifier");
    }
}




@end
