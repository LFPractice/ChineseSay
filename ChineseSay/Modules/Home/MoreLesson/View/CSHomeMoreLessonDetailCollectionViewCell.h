//
//  CSHomeMoreLessonDetailCollectionViewCell.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/6.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSHomeMoreLessonListDetailItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CSHomeMoreLessonDetailCollectionViewCell : UICollectionViewCell
- (void)loadData:(CSHomeMoreLessonListDetailItemModel *)model
       indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
