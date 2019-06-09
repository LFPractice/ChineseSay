//
//  CSGameModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSGameModel : CSBaseModel
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) long bgColor;
@end

NS_ASSUME_NONNULL_END
