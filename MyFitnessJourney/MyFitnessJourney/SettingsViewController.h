//
//  SettingsViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-20.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "StartViewController.h"

@interface SettingsViewController : UITableViewController

@property (nonatomic, weak) IBOutlet UITableViewCell *changeGoalWeight;
@property (nonatomic, weak) IBOutlet UITableViewCell *changeGoalDate;
@property (nonatomic, weak) IBOutlet UITableViewCell *changeUsername;
@property (nonatomic, weak) IBOutlet UITableViewCell *changePassword;
@property (nonatomic, weak) IBOutlet UITableViewCell *logout;





@end
