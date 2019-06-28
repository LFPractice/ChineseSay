//
//  CSQuestionFooterView.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/28.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,CSQuestionAction){
    CSQuestionActionSubmit = 1, // 提交
    CSQuestionActionNext = 2,  // 下一题
};
@interface CSQuestionFooterView : CSBaseView
@property (nonatomic, copy) void(^questionActionBlock)(CSQuestionAction action);
@end

NS_ASSUME_NONNULL_END
