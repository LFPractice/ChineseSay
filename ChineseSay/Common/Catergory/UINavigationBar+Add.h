//
//  UINavigationBar+Add.h
//  Test_Protocol
//
//  Created by 王林芳 on 2019/6/12.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (Add)
- (void)setColor:(UIColor *)color;
- (void)setColor:(UIColor *)color showBottomLine:(BOOL)isShow;
@end

NS_ASSUME_NONNULL_END
