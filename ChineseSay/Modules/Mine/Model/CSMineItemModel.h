//
//  CSMineItemModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/16.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSMineItemModel : CSBaseModel
@property (nonatomic, strong) NSString *imgName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *cellName;
@end

NS_ASSUME_NONNULL_END
