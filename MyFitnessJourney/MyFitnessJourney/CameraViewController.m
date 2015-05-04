//
//  CameraViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-19.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Action which presents camera view controller
- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"backToWeighin"]) {
        
        NewWeighinTableViewController *nwtvc = (NewWeighinTableViewController *) segue.destinationViewController;
    } if([segue.identifier  isEqual: @"DoneBackToWeighin"]) {
        
        UINavigationController *navcontroller = (UINavigationController*) segue.destinationViewController;
        NewWeighinTableViewController *nwtvc = [navcontroller topViewController];
        
        nwtvc.weighimage = self.chosenimage;
    }
}

//Segue when cancel
- (IBAction)didCancel:(id)sender {
    [self performSegueWithIdentifier:@"backToWeighin" sender:self];
}

//Segue when done
- (IBAction)clickedDone:(id)sender {
    // När man trycker done görs detta.
    [self performSegueWithIdentifier:@"DoneBackToWeighin" sender:self];
}

//Delegate for cameraview
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.pictureview.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    self.doneButton.enabled = YES;
    self.chosenimage = chosenImage;
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
