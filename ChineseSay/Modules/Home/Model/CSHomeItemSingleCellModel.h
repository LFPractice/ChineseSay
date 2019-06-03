//
//  CSHomeItemSingleCellModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeItemSingleCellModel : CSHomeCellModel
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *imgName;
@property (nonatomic, assign)long bgColor;
@end

NS_ASSUME_NONNULL_END
