//
//  SelectImageViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-10.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "SelectImageViewController.h"

@interface SelectImageViewController ()

@end

@implementation SelectImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)chooseImage:(id)sender {
    
    self.imagecontroller = [[UIImagePickerController alloc] init];
    self.imagecontroller.delegate = self;
    [self.imagecontroller setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:self.imagecontroller animated:YES completion:nil];
    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.chosenimage = info[UIImagePickerControllerOriginalImage];
    [self.imageview setImage: self.chosenimage];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.donebutton setEnabled:YES];
    
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)backClicked:(id)sender {

    [self performSegueWithIdentifier:@"backToWeighin" sender:self];
    
    
}



- (IBAction)doneClicked:(id)sender {
     [self performSegueWithIdentifier:@"doneBackToWeighin" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"backToWeighin"]) {
        
        UINavigationController *navcontroller = (UINavigationController*) segue.destinationViewController;
        NewWeighinTableViewController *ntvc = [navcontroller topViewController];
        
        ntvc.setweight = self.setweight;
        
       // NewWeighinTableViewController *ntvc = (NewWeighinTableViewController *) segue.destinationViewController;
    } else {
        
        UINavigationController *navcontroller = (UINavigationController*) segue.destinationViewController;
        NewWeighinTableViewController *ntvc = [navcontroller topViewController];
        /*
        NewWeighinTableViewController *ntvc = (NewWeighinTableViewController *) segue.destinationViewController;
        */
        ntvc.weighimage = self.chosenimage;
        ntvc.setweight = self.setweight;
        
    }
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
