//
//  LoginViewController.h
//  MyFitnessJourney
//
//  Created by Fredrik Ståhl on 2015-02-02.
//  Copyright (c) 2015 Stahlberg Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController <FBLoginViewDelegate>

@property (nonatomic, weak) IBOutlet FBLoginView *loginButton;
@property (nonatomic, weak) IBOutlet UILabel *lblLoginStatus;
@property (nonatomic, weak) IBOutlet UILabel *lblUsername;
@property (nonatomic, weak) IBOutlet UILabel *lblEmail;
@property (nonatomic, weak) IBOutlet FBProfilePictureView *profilePicture;

- (void)checkUserExistance: (NSString *) userid;


@end
