//
//  CSBaseCell.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSBaseCell : UITableViewCell
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path;
@end

NS_ASSUME_NONNULL_END
