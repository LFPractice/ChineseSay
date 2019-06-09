//
//  CSPageTransfer.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/4.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSPageTransfer.h"
#import "CSHomeMoreLessonListController.h"
#import "CSHomeMoreLessonListDetailController.h"
#import "CSHomeAppsController.h"

static CSPageTransfer *sharePageTransfer = nil;
@implementation CSPageTransfer

+ (CSPageTransfer *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!sharePageTransfer){
            sharePageTransfer = [[CSPageTransfer alloc]init];
        }
    });
    return sharePageTransfer;
}
- (void)dispatchTransFerActionWithPageModel:(CSPageTypeModel *)pageModel{
    if (nil == pageModel) return;
    
    // 处理跳转，根据model中的属性
    if ([pageModel.action isEqualToString:CS_Page_Type_Action]) {
        // 页面跳转
        [self pageViewControllerSkipByModel:pageModel];
    }
    else {
        // 其他action处理
    }
}
- (void)pageViewControllerSkipByModel:(CSPageTypeModel *)model {
    BOOL animated = model.animated;
    if([model.pageType isEqualToString:CS_Page_Type_Home_moreClassList]){
        // 更多课程
        CSHomeMoreLessonListController *vc = [[CSHomeMoreLessonListController alloc]init];
        vc.pageModel = model;
        [[self currentNavigatroller]pushViewController:vc animated:animated];
    }else if ([model.pageType isEqualToString:CS_Page_Type_Home_moreClassListDetail]){
        // 课程详情
        CSHomeMoreLessonListDetailController *vc = [[CSHomeMoreLessonListDetailController alloc]init];
        vc.pageModel = model;
        [[self currentNavigatroller]pushViewController:vc animated:animated];
    }else if ([model.pageType isEqualToString:CS_Page_Type_Home_Apps]){
        // 常用APP
        CSHomeAppsController *vc = [[CSHomeAppsController alloc]init];
        vc.pageModel = model;
        [[self currentNavigatroller]pushViewController:vc animated:animated];
    }
}
- (LFNavigationController *)currentNavigatroller{
    
    UIViewController * currVC = nil;
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIViewController * Rootvc = window.rootViewController;
    
    if([Rootvc isKindOfClass:[LFTabBarController class]]){
        LFTabBarController * tabVC = (LFTabBarController *)Rootvc;
        currVC = tabVC;
        Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
    }
    return (LFNavigationController *)Rootvc;
}
@end
