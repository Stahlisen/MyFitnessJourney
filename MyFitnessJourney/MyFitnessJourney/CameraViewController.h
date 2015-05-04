//
//  CameraViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-19.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewWeighinTableViewController.h"


@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *pictureview;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) UIImage *chosenimage;

- (IBAction)takePhoto:(id)sender;

- (IBAction)didCancel:(id)sender;

- (IBAction)clickedDone:(id)sender;



@end
