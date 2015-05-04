//
//  UserSignUpViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-22.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "UserSignUpViewController.h"

@interface UserSignUpViewController ()

@end

@implementation UserSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernamefield.delegate = self;
    self.passwordfield.delegate = self;
    self.emailfield.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)registerUser:(id)sender {

    //if checkfields equals true, the fields are not empty and the user is registered
    if (self.checkFields) {
        PFUser *user = [PFUser user];
        user.username = self.usernamefield.text;
        user.password = self.passwordfield.text;
        user.email = self.emailfield.text;
        
        

        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                //if no error, then run segue
                [self performSegueWithIdentifier:@"showSetGoal" sender:self];
                
            } else {
                //If error, display UIAlertView with error
                NSString *errorString = [error userInfo][@"error"];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                message:errorString
                                                               delegate:nil
                                                      cancelButtonTitle:@"Try again"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        }];
        
    } else {
        //If fields are empty, display UIAlertView with error
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                        message:@"You must enter all fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"Try again"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
  
}

//This method checks for empty textfields, if one or more fields are empty, the method returns NO.
- (BOOL) checkFields  {
    
    BOOL entered;
    
    if ([self.usernamefield.text isEqualToString:@""] || [self.passwordfield.text isEqualToString:@""] || [self.emailfield.text isEqualToString:@""])
    {
        entered = NO;
        //NSLog(@"User did not enter");
        
    }
    else {
        entered = YES;
        //NSLog(@"User entered");
    
    }
    
    return entered;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"showSetGoal"] && self.checkFields) {
        
        
        SetGoalViewController *setGoal = (SetGoalViewController*)segue.destinationViewController;
        //Send username to present label on SetGoalViewController
        setGoal.username = self.usernamefield.text;
    } else {
        
        NSLog(@"Other identifier");
    }
}

@end
