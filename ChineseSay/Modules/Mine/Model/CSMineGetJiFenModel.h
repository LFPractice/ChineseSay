//
//  CSMineGetJiFenModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/7.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSMineGetJiFenModel : NSObject
@property (nonatomic, strong) NSNumber *taskId;
@property (nonatomic, strong) NSString *taskName;
@property (nonatomic, strong) NSNumber *taskScore;
@property (nonatomic, strong) NSNumber *taskState;
@end

NS_ASSUME_NONNULL_END
