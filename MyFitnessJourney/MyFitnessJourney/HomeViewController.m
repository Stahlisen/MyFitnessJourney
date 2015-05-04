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
    [self loadUserData];
}

//Loading userdata from PFObject
- (void) loadUserData {
    
    //Get username of current user
    NSString *username = [NSString stringWithFormat:@"%@",[[PFUser currentUser]valueForKey:@"username"]];
    
    self.lblusername.text = [@"Welcome " stringByAppendingString: username];
    
    //Alloc and initiate array to store all weighins
    self.Weighins = [[NSMutableArray alloc] init];
    
    //Get all weighins for the current user from PFQuery
    PFQuery *query = [PFQuery queryWithClassName:@"Weighin"];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    NSArray *usersGoal = [query findObjects];
    for (unsigned i = 0; i < [usersGoal count]; i++) {
        
        Weighin *weighin = [Weighin new];
        weighin.date = [usersGoal[i] createdAt];
        weighin.weight = [usersGoal[i] objectForKey:@"weight"];
        
        PFFile *imageFile = [usersGoal[i] objectForKey:@"image"];
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                weighin.image = [UIImage imageWithData:data];
            } if (error) {
                NSLog(@"there was an error getting the image");
            }
        }];
        
        //Add all weighin objects to array
        [self.Weighins addObject: weighin];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
    }
    //Block to order the weighins by date
    NSSortDescriptor *firstDescriptor = [[NSSortDescriptor alloc]
                                         initWithKey:@"date" ascending:NO];
    NSArray * descriptors = [NSArray arrayWithObjects:firstDescriptor, nil];
    NSArray * sortedArray = [self.Weighins sortedArrayUsingDescriptors:descriptors];
    self.Weighins = sortedArray;
    
    
    self.lblcurrentweight.text = [[[[self.Weighins firstObject] weight] stringValue] stringByAppendingString:@" kg"];
    
    //Get goal for the current user from PFObject
    PFQuery *queryGoal = [PFQuery queryWithClassName:@"Goal"];
    [queryGoal whereKey:@"user" equalTo:[PFUser currentUser]];
    [queryGoal getFirstObjectInBackgroundWithBlock:^(PFObject *goal, NSError *error) {
        
        if (!error) {
            
            NSString *goalweight = [NSString stringWithFormat:@"%@", [goal valueForKey:@"weight"]];
            self.lblgoalweight.text = [goalweight stringByAppendingString:@" kg"];
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            
            NSDate *dategoal = [goal valueForKey:@"goaldate"];
            
            self.lblgoaldate.text = [NSString stringWithFormat:@"%@", [dateFormat stringFromDate: dategoal]];
            
            //Block to get remaining days until goal date
            NSDateFormatter *df = [NSDateFormatter new];
            [df setDateFormat:@"dd MM yyyy"];
            NSString *TodayString = [df stringFromDate:[NSDate date]];
            NSString *TargetDateString = [df stringFromDate:dategoal];
            NSTimeInterval time = [[df dateFromString:TargetDateString] timeIntervalSinceDate:[df dateFromString:TodayString]];
            int days = time / 60 / 60/ 24;
            NSString *daysuntil = [NSString stringWithFormat: @"%ld", (long)days];

            self.lblremaining.text = [daysuntil stringByAppendingString:@" days"];
            self.lbldaystogo.text = [daysuntil stringByAppendingString:@" days to go!"];
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
