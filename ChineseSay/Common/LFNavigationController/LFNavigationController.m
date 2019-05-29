//
//  LFNavigationController.m
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/10.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import "LFNavigationController.h"
#import "LFTabBarController.h"
@interface LFNavigationController ()

@end

@implementation LFNavigationController
+ (void)initialize{
    [[UINavigationBar appearance]setBarTintColor:[UIColor orangeColor]];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance]setTranslucent:NO];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.childViewControllers.count>0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 获取系统自带的滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
    // 创建全屏滑动手势，调用系统自带的滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
//    self.interactivePopGestureRecognizer.enabled = NO;
    
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if(self.childViewControllers.count == 1){
        return NO;
    }
    return YES;
}
@end











































