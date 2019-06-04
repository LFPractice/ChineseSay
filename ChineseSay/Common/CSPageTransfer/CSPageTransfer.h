//
//  CSPageTransfer.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/4.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSPageTypeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSPageTransfer : NSObject
/**
 *  单例
 *
 *  @return 对象
 */
+ (CSPageTransfer *)shareInstance;

/**
 *  根据pagetypemodel进行页面分发跳转
 *
 *  @param pageModel model
 */
- (void)dispatchTransFerActionWithPageModel:(CSPageTypeModel*)pageModel;
/**
 *获取当前的 naviagtionController
 */
- (LFNavigationController *)currentNavigatroller;//
@end

NS_ASSUME_NONNULL_END
