//
//  HomeViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-02.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface HomeViewController : UIViewController
@property (nonatomic, weak) NSString *userid;

@property (strong, nonatomic) IBOutlet UILabel *lblName;

@end
