//
//  HomeViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-02.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (nonatomic, weak) NSString *useremail;

@property (strong, nonatomic) IBOutlet UILabel *lblemail;

@end
