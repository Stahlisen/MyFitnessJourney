//
//  NewWeighinTableViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-10.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectImageViewController.h"
#import "JourneyViewController.h"
#import <Parse/Parse.h>
#import "CameraViewController.h"


@interface NewWeighinTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *weighttextfield;
@property (weak, nonatomic) UIImage *weighimage;
@property (weak, nonatomic) NSString *setweight;
@property (weak, nonatomic) IBOutlet UIImageView *weighinimageview;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;



@end
