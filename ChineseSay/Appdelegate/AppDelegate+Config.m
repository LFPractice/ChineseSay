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
    /*
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
     */
    UITabBarController *tab = [[UITabBarController alloc]init];
    CSHomeController *vc1 = [[CSHomeController alloc]init];
    CSGameController *vc2 = [[CSGameController alloc]init];
    CSMineController *vc3 = [[CSMineController alloc]init];
    
    LFNavigationController *nav1 = [[LFNavigationController alloc]initWithRootViewController:vc1];
    LFNavigationController *nav2 = [[LFNavigationController alloc]initWithRootViewController:vc2];
    LFNavigationController *nav3 = [[LFNavigationController alloc]initWithRootViewController:vc3];
    
//    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
//    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
//    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_home_normal"] selectedImage:[UIImage imageNamed:@"tab_home_selected"]];
    [nav1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHex:0xD2222A]} forState:UIControlStateSelected];
    
    nav2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"游戏" image:[UIImage imageNamed:@"tab_game_normal"] selectedImage:[UIImage imageNamed:@"tab_game_selected"]];
    [nav2.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHex:0xD2222A]} forState:UIControlStateSelected];
    
    nav3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"tab_mine_normal"] selectedImage:[UIImage imageNamed:@"tab_mine_selected"]];
    [nav3.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHex:0xD2222A]} forState:UIControlStateSelected];
    
    tab.viewControllers = @[nav1,nav2,nav3];
    
    tab.tabBar.tintColor = [UIColor colorWithHex:0xD2222A];
    tab.tabBar.barTintColor = [UIColor colorWithHex:0xD2222A];
    tab.tabBar.backgroundColor = [UIColor whiteColor];
    tab.tabBar.backgroundImage = [UIImage new];
    
    return tab;
    
    /*
    QMUITabBarViewController *tab = [[QMUITabBarViewController alloc]init];
    
    CSHomeController *vc1 = [[CSHomeController alloc]init];
    QMUINavigationController *nav1 = [[QMUINavigationController alloc]initWithRootViewController:vc1];
    nav1.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"首页" image:[UIImage imageNamed:@"tab_home_normal"] selectedImage:UIImageMake(@"tab_home_selected") tag:0];
    
    CSGameController *vc2 = [[CSGameController alloc]init];
    QMUINavigationController *nav2 = [[QMUINavigationController alloc]initWithRootViewController:vc2];
    nav1.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"游戏" image:[UIImage imageNamed:@"tab_home_normal"] selectedImage:UIImageMake(@"tab_home_selected") tag:1];
    
    CSMineController *vc3 = [[CSMineController alloc]init];
    QMUINavigationController *nav3 = [[QMUINavigationController alloc]initWithRootViewController:vc3];
    nav1.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"我的" image:[UIImage imageNamed:@"tab_home_normal"] selectedImage:UIImageMake(@"tab_home_selected") tag:2];
    
    tab.viewControllers = @[nav1,nav2,nav3];
    return tab;
     */
}
@end
