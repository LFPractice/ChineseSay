//
//  CSHomeItemsCellItem.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/3.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseView.h"
#import "CSHomeItemSingleCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeItemsCellItem : CSBaseView
@property (nonatomic, strong)CSHomeItemSingleCellModel *model;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@end

NS_ASSUME_NONNULL_END
