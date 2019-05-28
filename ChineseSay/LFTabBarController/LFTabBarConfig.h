//
//  LFTabBarConfig.h
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/10.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LFTabBarConfig : NSObject
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) BOOL isNavigation;
@property (nonatomic, strong) NSArray *normalImages;
@property (nonatomic, strong) NSArray *selectedImages;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *itemBackgroundColor;
@property (nonatomic, strong) UIColor *tabBarBackgroundColor;
@end
