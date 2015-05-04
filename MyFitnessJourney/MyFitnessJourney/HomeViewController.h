//
//  HomeViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-02.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Weighin.h"

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblusername;
@property (strong, nonatomic) IBOutlet UILabel *lblcurrentweight;
@property (strong, nonatomic) IBOutlet UILabel *lblgoalweight;
@property (strong, nonatomic) IBOutlet UILabel *lblgoaldate;
@property (strong, nonatomic) IBOutlet UILabel *lblremaining;
@property (strong, nonatomic) IBOutlet UILabel *lbldaystogo;
@property (nonatomic,strong) NSMutableArray *Weighins;








@end
