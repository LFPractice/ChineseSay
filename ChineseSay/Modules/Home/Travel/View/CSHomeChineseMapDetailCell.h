//
//  CSHomeChineseMapDetailCell.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/11.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSHomeMapDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CSHomeChineseMapDetailCell : UICollectionViewCell
- (void)loadDataWithModel:(CSHomeMapDetailModel *)model forIndex:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
