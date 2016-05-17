//
//  LoginViewController.h
//  ChillN
//
//  Created by Vincent Jardel on 20/05/2014.
//  Copyright (c) 2014 Jardel Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "CBZSplashView.h"
#import "UIColor+CustomColors.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIView *backgroundImageView;
@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) CBZSplashView *splashView;

- (IBAction)login;

@end