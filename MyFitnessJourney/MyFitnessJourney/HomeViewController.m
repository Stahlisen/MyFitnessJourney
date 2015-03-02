//
//  HomeViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-02.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.userid = @"fred123";
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    
    [query whereKey:@"userid" equalTo:self.userid];

    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        if (!object) {
            
            NSLog(@"User does not exist");
            
        }
        
        else
        {
            NSLog(@"User exists");
            NSLog(@"%@", object.objectId);
            NSString *name = object [@"Name"];
            self.lblName.text = name;
        
        }
        
        
    }];
    
    PFObject *user = [PFObject objectWithoutDataWithClassName:@"User" objectId:@"yGmwG6ak5J"];
    
    PFObject *goal = [PFObject objectWithoutDataWithClassName:@"Goal" objectId:@"FhS6R3WFBE"];
    
    //[user setObject: goal forKey:@"goal"];
   // [goal setObject: user forKey:@"author"];
    
    //user[@"Child"] = [PFObject objectWithoutDataWithClassName:@"Goal" objectId:@"FhS6R3WFBE"];
    
   // [user saveInBackground];
   
    PFQuery *query1 = [PFQuery queryWithClassName:@"User"];
   // [query1 whereKey:@"goal" equalTo:goal];
    
    //PFObject *post = query1[@"goal"];
    
  /*  [post fetchIfNeededInBackgroundWithBlock:^(PFObject *post, NSError *error) {
        NSString *title = post[@"objectId"];
        NSLog(@"%d", title);
        // do something with your title variable
    }];
*/
    
   /* PFQuery *goalQuery = [goalForUser query];
    
    [goalQuery findObjects];
    */
    
    
/*
    self.lblemail.text = [NSString stringWithFormat: @"Welcome back %@", self.useremail];
    
    PFObject *newUser = [PFObject objectWithClassName:@"User"];
    newUser[@"userid"] = @"Heuehue";
    newUser[@"Name"] = @"Fredrik";
    newUser[@"Secondname"] = @"Ståhl";

    [newUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Succeeded");
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
 */
    
    // Do any additional setup after loading the view.
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
