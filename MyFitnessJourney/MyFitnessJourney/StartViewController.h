//
//  StartViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-06.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HomeViewController.h"






@interface StartViewController : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernamefield;
@property (weak, nonatomic) IBOutlet UITextField *passwordfield;

@property (weak, nonatomic) IBOutlet UILabel *lbltitle;

@end
