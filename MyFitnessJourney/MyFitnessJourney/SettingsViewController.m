//
//  SettingsViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-20.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section ==0 && indexPath.row == 0) {
        //Change username
        
    }
    if (indexPath.section ==0 && indexPath.row == 1) {
        //Change password
        
    }
    if (indexPath.section ==0 && indexPath.row == 2) {
        //Log out
        [PFUser logOut];
        
        [self performSegueWithIdentifier:@"toLoginScreen" sender:self];
    }
    if (indexPath.section ==1 && indexPath.row == 0) {
        //Change goal weight
        
    }
    if (indexPath.section ==1 && indexPath.row == 1) {
        //Change goal date
       
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"toLoginScreen"]) {
        StartViewController *stv = (StartViewController *) segue.destinationViewController;
    }
}


#pragma mark - Table view data source
@end
