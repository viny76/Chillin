//
//  AppDelegate.m
//  ChillN
//
//  Created by Vincent Jardel on 26/03/2015.
//  Copyright (c) 2015 ChillCompany. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//     Heroku Migration
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        configuration.applicationId = @"VpU4JfFKNOI1syoeVaWwmSGbDeMFBfVLld2T7Fdi";
        configuration.clientKey = @"1UxA7TR2HDuFSnILmLrJWi7zdlsnQz2ZYj2t9kls";
        configuration.server = @"http://chilln.herokuapp.com/parse";
    }]];
    [PFUser enableRevocableSessionInBackground];
    
    // Push Notifications
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes  categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
    
    
//    [Parse setApplicationId:@"VpU4JfFKNOI1syoeVaWwmSGbDeMFBfVLld2T7Fdi"
//                  clientKey:@"1UxA7TR2HDuFSnILmLrJWi7zdlsnQz2ZYj2t9kls"];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"logged"]) { // LOGGED = TRUE
        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    } else {
        UIViewController* rootController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginViewController"];
        UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:rootController];
        
        self.window.rootViewController = navigation;
    }
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    if ([PFUser currentUser] != nil) {
        [currentInstallation setObject:@[[PFUser currentUser].objectId] forKey:@"channels"];
    }
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
