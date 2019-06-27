//
//  CSGameQuestionCollectionViewCell.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSGameQuetionModel.h"
#import "CSGameQuestionCollectionViewFlowLayout.h"
NS_ASSUME_NONNULL_BEGIN

@interface CSGameQuestionCollectionViewCell : UICollectionViewCell
- (void)loadData:(CSGameQuetionModel *)model
       indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
