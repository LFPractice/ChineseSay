//
//  LFTabBarController.h
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/9.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFTabBarConfig.h"
#import "LFNavigationController.h"

typedef LFTabBarConfig* (^tabBarBlock)(LFTabBarConfig *config);
@interface LFTabBarController : UITabBarController

/*
 是否可用自动旋转屏幕
 */
@property (nonatomic, assign) BOOL isAutoRotation;

/*
 创建tabBarController
 */
+ (instancetype)createTabBarController:(tabBarBlock)block;

/*
 获取当前的tabBarController实例,实例创建后可获取
 */
+ (instancetype)defaultTabBarController;

/*
 隐藏底部tabBar
 @param isAnimation 是否需要动画
 */
- (void)hiddenTabBarWithAnimation:(BOOL)isAnimation;

/*
 显示底部tabBar
 @param isAnimation 是否需要动画
 */
- (void)showTabBarWithAnimation:(BOOL)isAnimation;
@end









































