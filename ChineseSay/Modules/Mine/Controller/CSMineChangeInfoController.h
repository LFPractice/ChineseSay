//
//  CSMineChangeInfoController.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ChangeInfoType) {
    ChangeInfoTypeNickName = 1,
};
@interface CSMineChangeInfoController : CSBaseController
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *placeHolder;
@end

NS_ASSUME_NONNULL_END
