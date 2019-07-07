//
//  CSHomeEssayItemCell.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/3.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseCell.h"
#import "CSHomeEssayListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CSHomeEssayItemCell : CSBaseCell
@property (nonatomic, strong) CSHomeEssayListModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *label_content;
@end

NS_ASSUME_NONNULL_END
