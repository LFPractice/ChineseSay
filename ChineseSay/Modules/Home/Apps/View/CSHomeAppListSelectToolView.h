//
//  CSHomeAppListSelectToolView.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeAppListSelectToolView : CSBaseView
@property (nonatomic, copy) void(^selectBlock)(NSInteger tag);
@end

NS_ASSUME_NONNULL_END
