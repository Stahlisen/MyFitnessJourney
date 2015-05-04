//
//  JourneyViewController.m
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-02.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import "JourneyViewController.h"
#import "Weighin.h"

@interface JourneyViewController ()

@end

@implementation JourneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self getWeighins];
}

//Load all weighins from PFObject
- (void) getWeighins {
    
    //Alloc and initiate the array for storing weighins
    self.Weighins = [[NSMutableArray alloc] init];
    
    //Get all weighins for the current user
    PFQuery *query = [PFQuery queryWithClassName:@"Weighin"];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    NSArray *usersGoal = [query findObjects];
    for (unsigned i = 0; i < [usersGoal count]; i++) {
        
        Weighin *weighin = [Weighin new];
        weighin.date = [usersGoal[i] createdAt];
        weighin.weight = [usersGoal[i] objectForKey:@"weight"];
       
        PFFile *imageFile = [usersGoal[i] objectForKey:@"image"];
        
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                
                weighin.image = [UIImage imageWithData:data];
                
                
            } if (error) {
                NSLog(@"there was an error getting the image");
            }
         
        }];
          
        
        //Add all weighin objects to array
        [self.Weighins addObject: weighin];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

        
    }
    
    //Sorting array for latest dates
    NSSortDescriptor *firstDescriptor = [[NSSortDescriptor alloc]
                                           initWithKey:@"date" ascending:NO];
    NSArray * descriptors = [NSArray arrayWithObjects:firstDescriptor, nil];
    NSArray * sortedArray = [self.Weighins sortedArrayUsingDescriptors:descriptors];
    self.Weighins = sortedArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.Weighins count];
}

//Using GCD to load images to tableview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *kg = @" kg";
    static NSString *CellIdentifier =@"Cell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            cell.imageView.image = [[self.Weighins objectAtIndex:indexPath.row] image];
            [cell setNeedsLayout];
            
        });
    });
    
    NSString *cellweight = [[[self.Weighins objectAtIndex:indexPath.row] weight] stringValue];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate *dateforcell = [[self.Weighins objectAtIndex:indexPath.row] date];
    
    NSString *celldate = [dateFormat stringFromDate: dateforcell];
    
    cell.textLabel.text= [cellweight stringByAppendingString:kg];
    cell.detailTextLabel.text = celldate;
    cell.textLabel.textColor = [UIColor colorWithRed:129.0/255.0 green:181.0/255.0 blue:20.0/255.0 alpha:1.0];


    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    DetailWeightViewController *dwvc = [self.storyboard instantiateViewControllerWithIdentifier:@"detailweighin"];

    dwvc.weighin = [self.Weighins objectAtIndex:indexPath.row];
    
    dwvc.weightvalue.text = [[[self.Weighins objectAtIndex:indexPath.row] weight] stringValue];
    
    dwvc.weightimage.image = [[self.Weighins objectAtIndex:indexPath.row] image];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateforcell = [[self.Weighins objectAtIndex:indexPath.row] date];
    
    NSString *celldate = [dateFormat stringFromDate: dateforcell];
    dwvc.datevalue.text = celldate;

    [self.navigationController pushViewController:dwvc animated:YES];
    
}
@end
