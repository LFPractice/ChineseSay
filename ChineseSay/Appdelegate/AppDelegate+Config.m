//
//  AppDelegate+Config.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/5/28.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "AppDelegate+Config.h"
#import "LFTabBarController.h"
#import "LFNavigationController.h"
#import "CSHomeController.h"
#import "CSGameController.h"
#import "CSMineController.h"
@implementation AppDelegate (Config)
- (BOOL)CSApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window.rootViewController = [self setUpRootController];
    return YES;
}
- (id)setUpRootController{
    LFTabBarController *tab = [LFTabBarController createTabBarController:^LFTabBarConfig *(LFTabBarConfig *config) {
        CSHomeController *vc1 = [[CSHomeController alloc]init];
        CSGameController *vc2 = [[CSGameController alloc]init];
        CSMineController *vc3 = [[CSMineController alloc]init];
        
        config.viewControllers = @[vc1,vc2,vc3];
        config.normalColor = [UIColor colorWithHex:0xCBCBC0];
        config.selectedColor = [UIColor colorWithHex:0x6C80A8];
        config.selectedImages = @[@"tab_home_selected",@"tab_game_selected",@"tab_mine_selected"];
        config.normalImages = @[@"tab_home_normal",@"tab_game_normal",@"tab_mine_normal"];
        config.titles = @[@"首页",@"游戏",@"我的"];
        config.isNavigation = YES;;
        config.tabBarBackgroundColor = [UIColor whiteColor];
        
        return config;
    }];
    return tab;
}
@end
