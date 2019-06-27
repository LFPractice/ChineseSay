//
//  CSGameQuestionItemCell.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseCell.h"
#import "CSGameQuestionItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CSGameQuestionItemCell : CSBaseCell
- (void)loadData:(CSGameQuestionItemModel *)model IndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
