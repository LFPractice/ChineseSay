//
//  UIColor+Add.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/3.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Add)
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
@end

NS_ASSUME_NONNULL_END
