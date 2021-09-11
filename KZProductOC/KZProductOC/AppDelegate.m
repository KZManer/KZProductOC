//
//  AppDelegate.m
//  KZProductOC
//
//  Created by KZ on 2021/9/11.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    Class cl = NSClassFromString(@"ViewController");
    UIViewController *rootVC = [[cl alloc]init];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
