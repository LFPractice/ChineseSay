//
//  AppDelegate+Config.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/5/28.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "AppDelegate+Config.h"
#import "LFTabBarController.h"
@implementation AppDelegate (Config)
- (BOOL)CSApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window.rootViewController = [self setUpRootController];
    return YES;
}
- (id)setUpRootController{
    LFTabBarController *tab = [LFTabBarController createTabBarController:^LFTabBarConfig *(LFTabBarConfig *config) {
        UIViewController *vc1 = [[UIViewController alloc]init];
        UIViewController *vc2 = [[UIViewController alloc]init];
        UIViewController *vc3 = [[UIViewController alloc]init];
        
        config.viewControllers = @[vc1,vc2,vc3];
        config.normalColor = [UIColor grayColor];
        config.selectedColor = [UIColor orangeColor];
        config.selectedImages = @[@"",@"",@""];
        config.normalImages = @[@"",@"",@""];
        config.titles = @[@"首页",@"导航",@"我的"];
        config.isNavigation = YES;
        config.tabBarBackgroundColor = [UIColor blackColor];
        
        return config;
    }];
    return tab;
}
@end
