//
//  Weighin.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-04-09.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Weighin : NSObject

@property (strong, nonatomic) NSNumber *weight;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) UIImage *image;

@end
