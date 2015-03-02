//
//  UserSignUpViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-22.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SetGoalViewController.h"

@interface UserSignUpViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *usernamefield;
@property (weak, nonatomic) IBOutlet UITextField *passwordfield;
@property (weak, nonatomic) IBOutlet UITextField *emailfield;

- (BOOL) checkFields;
@end
