//
//  DetailWeightViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-19.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weighin.h"

@interface DetailWeightViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *weightvalue;
@property (weak, nonatomic) IBOutlet UILabel *datevalue;

@property (weak, nonatomic) IBOutlet UIImageView *weightimage;
@property (weak, nonatomic) Weighin *weighin;
@property (weak, nonatomic) IBOutlet UILabel *nopic;

@end
