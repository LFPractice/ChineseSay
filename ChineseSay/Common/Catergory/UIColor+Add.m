//
//  UIColor+Add.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/3.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "UIColor+Add.h"

@implementation UIColor (Add)
+ (UIColor *)colorWithHex:(long)hexColor{
    
    return [UIColor colorWithHex:hexColor alpha:1.0];
}
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}
@end
