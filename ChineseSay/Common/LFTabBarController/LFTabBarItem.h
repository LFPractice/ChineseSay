//
//  LFTabBarItem.h
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/9.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFTabBarItemDelegate;

@interface LFTabBarItem : UIView
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) UIColor *titleColor;
@property(nonatomic,assign) id<LFTabBarItemDelegate> delegate;
@end

@protocol LFTabBarItemDelegate<NSObject>
- (void)tabBarItem:(LFTabBarItem *)item didSelectIndex:(NSInteger)index;
@end
