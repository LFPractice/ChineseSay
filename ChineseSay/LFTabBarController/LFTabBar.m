//
//  LFTabBar.m
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/10.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import "LFTabBar.h"
@interface LFTabBar()<LFTabBarItemDelegate>

@end
@implementation LFTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
        [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    // 移除系统的tabBarItem
    Class class = NSClassFromString(@"UITabBarButton");
    for(UIView *item in self.subviews){
        if([item isKindOfClass:class]){
            [item removeFromSuperview];
        }
    }
    // 设置自定义的tabBarItem
    [self setupItems];
}
- (void)setupItems{
    CGFloat width = CGRectGetWidth(self.frame)/self.lfItems.count;
    CGFloat height = 49;//CGRectGetHeight(self.frame);
    
    for(int i =0; i < self.lfItems.count; i++){
        LFTabBarItem *item = [self.lfItems objectAtIndex:i];
        item.frame = CGRectMake(i * width, 0, width, height);
        [item setBackgroundColor:_itemBackgroundColor];
        [self addSubview:item];
        item.delegate = self;
    }
    
}
- (void)tabBarItem:(LFTabBarItem *)item didSelectIndex:(NSInteger)index{
    if(self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tabBar:didSelectItem:atIndex:)]){
        [self.lfDelegate tabBar:self didSelectItem:item atIndex:index];
    }
}
@end
