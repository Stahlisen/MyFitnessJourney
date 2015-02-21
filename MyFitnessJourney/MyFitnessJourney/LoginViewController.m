//
//  LoginViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-02.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

-(void)toggleHiddenState:(BOOL)shouldHide;

@end

@implementation LoginViewController

-(void)toggleHiddenState:(BOOL)shouldHide{
    self.lblUsername.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    self.loginButton.delegate = self;
     NSLog(@"Running viewdidLoad");
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged in.";
    
    [self toggleHiddenState:NO];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{

    int lol = 1;
    NSLog(@"%d", lol + 1);
    NSLog(@"Running fetcheduserinfo");
    [self checkUserExistance:user.id];
}

-(void) checkUserExistance: (NSString *) userid {
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"userid" equalTo:userid];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        
        if (!object) {
            
            NSLog(@"User does not exist");
            [self performSegueWithIdentifier:@"showHome" sender:self];
        }
        
        else
        {
            NSLog(@"User exists");
            [self performSegueWithIdentifier:@"showHome" sender:self];
        }
        
        
    }];
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"showHome"]) {
        
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        HomeViewController *eventsController = [navController topViewController];
        
        
      //  NSString * username = [[NSString alloc] initWithFormat:@"%@", username_tf.text];
        //[eventsController setUsername:username];
        
      //  HomeViewController *hvc = [segue destinationViewController];
       // hvc.useremail = self.lblEmail.text;
        
        
    }
}




-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged out";
    
    [self toggleHiddenState:YES];
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
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
