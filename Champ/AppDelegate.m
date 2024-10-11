//
//  AppDelegate.m
//  Champ
//
//  Created by Wafa Bahha on 2/16/15.
//  Copyright (c) 2015 Wafa_Bahha. All rights reserved.
//

#import "AppDelegate.h"
#import "mainstartViewController.h"
@implementation AppDelegate
{
    mainstartViewController *mvc;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    if( [ [ UIScreen mainScreen ] bounds ].size.height==568.0)
    {
        iphone5=true;
    }
    else if([ [ UIScreen mainScreen ] bounds ].size.height==480.0)
    {
        iphone4=true;
    }
    else if([ [ UIScreen mainScreen ] bounds ].size.height==667.0)
    {
        iphone6=true;
    }
    else if([ [ UIScreen mainScreen ] bounds ].size.height==736.0)
    {
        iphone6plus=true;
    }
    else
    {
        ipad=true;
    }
    
    if(iphone4)
    {
        mvc=[[mainstartViewController alloc]initWithNibName:@"mainstartViewController@4" bundle:nil];
    }
    else if(iphone5)
    {
        mvc=[[mainstartViewController alloc]initWithNibName:@"mainstartViewController" bundle:nil];
    }
    else if(iphone6)
    {
        mvc=[[mainstartViewController alloc]initWithNibName:@"mainstartViewController@6" bundle:nil];
    }
    else if (iphone6plus)
    {
        mvc=[[mainstartViewController alloc]initWithNibName:@"mainstartViewController@6plus" bundle:nil];
    }
    else
    {
        mvc=[[mainstartViewController alloc]initWithNibName:@"mainstartViewController@ipad" bundle:nil];
    }
    
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:mvc];
self.window.rootViewController=nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
