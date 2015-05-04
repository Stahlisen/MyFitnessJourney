//
//  StartViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-06.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernamefield.delegate = self;
    self.passwordfield.delegate = self;

    [self sessionControl];
    }

- (void) sessionControl {
    
    if ([PFUser currentUser] != nil) {
        
        
    NSString *username = [NSString stringWithFormat:@"%@",[[PFUser currentUser]valueForKey:@"username"]];
        NSString *message = [NSString stringWithFormat: @"Log in as %@", username];
        
        UIAlertView *loginas = [[UIAlertView alloc] initWithTitle:@"Welcome"
                                                          message: message                                                 delegate:self
                                                cancelButtonTitle:@"No, log out"
                                                otherButtonTitles:@"Yes, continue", nil];
                [loginas show];
        
        NSLog(@"There is an active session.");
        NSLog(@"Current user logged in: ");
        NSLog(@"%@",[[PFUser currentUser]valueForKey:@"username"]);
    }

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [PFUser logOut];
        self.usernamefield.text = @"";
        self.passwordfield.text = @"";
    }
    if (buttonIndex == 1)
    {
        //GO to homepage
        //Code for download button
        NSLog(@"clicked continue");
        [self performSegueWithIdentifier:@"showHome" sender:self];
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)loginWithUser:(id)sender {
    
    NSString *username = self.usernamefield.text;
    NSString *password = self.passwordfield.text;
    [PFUser logInWithUsernameInBackground:username password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                        [self performSegueWithIdentifier:@"showHome" sender:self];
                                            
                                        } else {
                                             NSLog(@"Failed");
                                            UIAlertView *loginfailed = [[UIAlertView alloc]
                                                initWithTitle:@"Login failed"
                                                message:@"Wrong username or password"
                                                delegate:self
                                                cancelButtonTitle:@"Try again"
                                                otherButtonTitles:nil];
                                            [loginfailed show];
                                            

                                            
                                        }
                                    }];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"showHome"]) {
        
        HomeViewController *hvc = (HomeViewController *) segue.destinationViewController;
        
    } else {
        
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
