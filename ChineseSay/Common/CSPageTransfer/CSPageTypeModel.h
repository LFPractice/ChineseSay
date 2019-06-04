//
//  CSPageTypeModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/4.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSPageTypeModel : NSObject
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *pageType;//页面类型
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) id exparam;//扩展参数
@property (nonatomic, assign) BOOL animated;//是否展示页面跳转动画
@end

NS_ASSUME_NONNULL_END
