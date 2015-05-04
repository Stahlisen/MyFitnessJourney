//
//  NewWeighinTableViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-10.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "NewWeighinTableViewController.h"

@interface NewWeighinTableViewController ()

@end

@implementation NewWeighinTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.weighttextfield.delegate = self;
    
    if (self.weighimage != nil) {
        
        [self.weighinimageview setHidden:NO];
        [self.weighinimageview setImage: self.weighimage];
    }
    
    if (self.setweight != nil) {
        
        self.weighttextfield.text = self.setweight;
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"selectPhoto"]) {
        
        SelectImageViewController *svc = (SelectImageViewController *) segue.destinationViewController;
        svc.setweight = self.weighttextfield.text;
        
    } if ([segue.identifier  isEqual: @"backToJourney"]) {
        UITabBarController *tbc = (UITabBarController *) segue.destinationViewController;
        [tbc setSelectedIndex:1];
        
    } if ([segue.identifier  isEqual: @"takePhoto"]) {
        
        CameraViewController *cvc = (CameraViewController *) segue.destinationViewController;
        
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    //Enabling done-button if user entered anything
    NSUInteger length = self.weighttextfield.text.length - range.length + string.length;
    if (length > 0) {
        self.doneButton.enabled = YES;
    } else {
        self.doneButton.enabled = NO;
    }
    return YES;
}

- (IBAction)clickedDone:(id)sender {
    [self saveNewWeighinData];
}

//Saves new weighin to PFObject
- (void) saveNewWeighinData {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *weightentered = [f numberFromString:self.weighttextfield.text];
    
    // Creates the goal
    PFObject *newweighin = [PFObject objectWithClassName:@"Weighin"];
    
    newweighin[@"weight"] = weightentered;
    
    if (self.weighimage != nil) {
        NSLog(@"image does exist");
        NSData* imagedata = UIImageJPEGRepresentation(self.weighimage, 0.5f);
        PFFile *imagefile = [PFFile fileWithName:@"weighinimage.jpg" data:imagedata];
        
        newweighin[@"image"] = imagefile;
    } else {
        //newweighin[@"image"] = nil;
        NSLog(@"image doesnt exist");
    }
    newweighin[@"user"] = [PFUser currentUser];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
    [newweighin save];
        });
    });
    [self performSegueWithIdentifier:@"backToJourney" sender:self];
}

//When user clicks take a photo
- (IBAction)takePhoto:(id)sender {
    [self performSegueWithIdentifier:@"takePhoto" sender:self];
}

//When a user clicks add existing photo
- (IBAction)addExistingPhoto:(id)sender {
    [self performSegueWithIdentifier:@"selectPhoto" sender:self];
}

//When user clicks cancel
- (IBAction)clickedCancel:(id)sender {
    
    [self performSegueWithIdentifier:@"backToJourney" sender:self];
}


@end
