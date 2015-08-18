//
//  AppDelegate.m
//  JSPatchDemo
//
//  Created by 张亚丰 on 15/8/18.
//  Copyright (c) 2015年 zhangyafeng. All rights reserved.
//

#import "AppDelegate.h"

//第一步加入头文件
#import "JPEngine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //第二步导入引擎
    [JPEngine startEngine];
    
    
//    [self runJSCode];
    [self runLocalJSFile];
    return YES;
}
// 直接执行js
-(void)runJSCode {
    /**
     UIAlertView *alertView = [[UIAlertView alloc] init];
     [alertView setTitle:@"Alert"];
     [alertView setMessage:@"AlertView from js"];
     [alertView addButtonWithTitle:@"OK"];
     [alertView show];
     */
    
    [JPEngine evaluateScript:@"\
     var alertView = require('UIAlertView').alloc().init();\
     alertView.setTitle('Alert');\
     alertView.setMessage('AlertView from js'); \
     alertView.addButtonWithTitle('OK');\
     alertView.show(); \
     "];
}

//执行本地js文件
-(void)runLocalJSFile {
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"js"];
    NSString *content = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:content];
}

//exec js file from network
-(void)runJSFromNetwork {
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://cnbang.net/test.js"]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *script = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [JPEngine evaluateScript:script];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
