//
//  LFTabBar.h
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/10.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFTabBarItem.h"
@protocol LFTabBarDelegate;

@interface LFTabBar : UITabBar
@property (nonatomic, strong) NSArray<LFTabBarItem *> *lfItems;
@property (nonatomic, assign) id <LFTabBarDelegate> lfDelegate;
@property (nonatomic, strong) UIColor *itemBackgroundColor;
@end

@protocol LFTabBarDelegate <NSObject>
- (void)tabBar:(LFTabBar *)tab didSelectItem:(LFTabBarItem *)item atIndex:(NSInteger)index;
@end
