//
//  SelectImageViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-10.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewWeighinTableViewController.h"

@interface SelectImageViewController : UIViewController <UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) UIImage* chosenimage;
@property (strong, nonatomic) UIImagePickerController *imagecontroller;
@property (weak, nonatomic) NSString *setweight;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *donebutton;


@end
