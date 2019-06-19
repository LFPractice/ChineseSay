//
//  CSHomeCellModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeCellModel : CSBaseModel
@property (nonatomic, assign) NSInteger cellHeight;
@property (nonatomic, strong) NSString * cellName;
@property (nonatomic, strong) NSString *key_backgroundModel;
@end

NS_ASSUME_NONNULL_END
