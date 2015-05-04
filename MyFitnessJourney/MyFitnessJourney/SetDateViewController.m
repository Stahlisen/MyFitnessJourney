//
//  SetDateViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-24.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "SetDateViewController.h"

@interface SetDateViewController ()

@end

@implementation SetDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)registerDate:(id)sender
{
    PFUser *user = [PFUser currentUser];
    
    NSDate *pickerDate = [self.datepicker date];
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM/dd/yyyy"];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Goal"];
    [query whereKey:@"user" equalTo:user];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *goal, NSError *error) {
    
        if (!error) {
           //The find succeeded
            [goal setObject:pickerDate forKey:@"goaldate"];
            [goal saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                
                if (succeeded){
                    NSLog(@"Object Uploaded!");
                    [self performSegueWithIdentifier:@"showHome" sender:self];
                    
                }
                else{
                    NSString *errorString = [[error userInfo] objectForKey:@"error"];
                    NSLog(@"Error: %@", errorString);
                }
                
            }];
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"showHome"]) {
        
        HomeViewController *hvc = (HomeViewController *) segue.destinationViewController;
        
    } else {
        
        NSLog(@"Other identifier");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
