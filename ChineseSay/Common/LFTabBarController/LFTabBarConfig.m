//
//  LFTabBarConfig.m
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/10.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import "LFTabBarConfig.h"

@implementation LFTabBarConfig
- (instancetype)init
{
    self = [super init];
    if (self) {
        _isNavigation = YES;
        _normalColor = [UIColor grayColor];
        _selectedColor = [UIColor redColor];
    }
    return self;
}
@end
