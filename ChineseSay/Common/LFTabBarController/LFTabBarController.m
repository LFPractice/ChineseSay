//
//  LFTabBarController.m
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/9.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import "LFTabBarController.h"
#import "LFTabBar.h"

static CGFloat lfTabBarHeight = 49.0;
@interface LFTabBarController ()<LFTabBarDelegate>
@property (nonatomic, strong) LFTabBar *customtabBar;
@property (nonatomic, strong) LFTabBarConfig *config;

@end

@implementation LFTabBarController
- (LFTabBar *)customtabBar{
    if(_customtabBar == nil){
        _customtabBar = [[LFTabBar alloc]init];
        _customtabBar.lfDelegate = self;
    }
    return _customtabBar;
}
+(instancetype)createTabBarController:(tabBarBlock)block{
    static dispatch_once_t onceTocken;
    static LFTabBarController *tabBarController;
    dispatch_once(&onceTocken, ^{
        tabBarController = [[LFTabBarController alloc]initWithBlock:block];
    });
    
    return tabBarController;
}
+(instancetype)defaultTabBarController{
    return [LFTabBarController createTabBarController:nil];
}
- (instancetype)initWithBlock:(tabBarBlock)block{
    self = [super init];
    if(self){
        LFTabBarConfig *config = [[LFTabBarConfig alloc]init];
        NSCAssert(block, @"Param in the fuction,can not be nil");
        if(block){
            _config = block(config);
        }
        NSCAssert(_config.viewControllers, @"Param 'viewControllers' in the 'config', can not be nil");
        [self setupViewControllers];
        [self setupTabBar];
        _isAutoRotation = YES;
    }
    return self;
}
- (void)setupViewControllers{
    if(_config.isNavigation){
        NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:_config.viewControllers.count];
        for(UIViewController *vc in _config.viewControllers){
            if(![vc isKindOfClass:[LFNavigationController class]]){
                LFNavigationController *nav = [[LFNavigationController alloc]initWithRootViewController:vc];
                [vcs addObject:nav];
            }
            else{
                [vcs addObject:vc];
            }
            self.viewControllers = [vcs copy];
        }
    }else{
        self.viewControllers = [_config.viewControllers copy];
    }
}
- (void)setupTabBar{
    
    NSMutableArray *items = [NSMutableArray array];
    for(int i = 0; i < _config.viewControllers.count;i++){
        LFTabBarItem *item = [[LFTabBarItem alloc]init];
        if(i == 0){
            item.icon = _config.selectedImages[i];
            if(_config.titles.count > 0){
                item.titleColor = _config.selectedColor;
            }
        }else{
            item.icon = _config.normalImages[i];
            if(_config.titles.count > 0){
                item.titleColor = _config.normalColor;
            }
        }
        
        if(i < _config.titles.count){
            item.title = _config.titles[i];
        }
        
        [items addObject:item];
        item.tag = i;
    }
    self.customtabBar.lfItems = [items copy];
    self.customtabBar.itemBackgroundColor = [UIColor clearColor];
    self.customtabBar.backgroundColor = _config.tabBarBackgroundColor;
    self.customtabBar.frame = CGRectMake(0, CGRectGetHeight(self.tabBar.frame) - lfTabBarHeight, CGRectGetWidth(self.tabBar.frame), lfTabBarHeight);
    [self.tabBar addSubview:self.customtabBar];
}
- (void)hiddenTabBarWithAnimation:(BOOL)isAnimation{
    if(isAnimation){
        [UIView animateWithDuration:0.2 animations:^{
            self.customtabBar.alpha = 0;
        }];
    }else{
        self.customtabBar.alpha = 0;
    }
}
- (void)showTabBarWithAnimation:(BOOL)isAnimation{
    if(isAnimation){
        [UIView animateWithDuration:0.2 animations:^{
            self.customtabBar.alpha = 1.0;
        }];
    }else{
        self.customtabBar.alpha = 1.0;
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.selectedIndex = 0;
}

#pragma mark--LFTabBarDelegate
- (void)tabBar:(LFTabBar *)tab didSelectItem:(LFTabBarItem *)item atIndex:(NSInteger)index{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:0];
    for(UIView *view in tab.subviews){
        if([view isKindOfClass:[LFTabBarItem class]]){
            [items addObject:view];
        }
    }
    
    for(int i = 0; i < items.count; i ++){
        UIView *view = items[i];
        if([view isKindOfClass:[LFTabBarItem class]]){
            LFTabBarItem *item = (LFTabBarItem *)view;
            item.icon = self.config.normalImages[i];
            if(self.config.titles.count > 0){
                item.titleColor = _config.normalColor;
            }
        }
    }
    item.icon = self.config.selectedImages[index];
    if(self.config.titles.count > 0){
        item.titleColor = self.config.selectedColor;
    }
    self.selectedIndex = index;
}

#pragma mark--屏幕旋转时调整tabbar
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    self.customtabBar.frame = CGRectMake(0, size.height - lfTabBarHeight, size.width, lfTabBarHeight);
}
- (BOOL)shouldAutorotate{
    return self.isAutoRotation;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if(self.isAutoRotation){
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}
@end
