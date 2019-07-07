//
//  CSBaseController.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSBaseController : UIViewController
@property (nonatomic, strong) UIView *view_navigationBar;
@property (nonatomic, strong) CSPageTypeModel *pageModel;
@property (nonatomic, strong) UIImageView *img_bg;
- (void)createUI;
- (void)setBlackBackItem;
- (void)setWhiteBackItem;
- (void)setTitle:(NSString *)title Color:(UIColor *)color;
- (void)backClick;
@end

NS_ASSUME_NONNULL_END
