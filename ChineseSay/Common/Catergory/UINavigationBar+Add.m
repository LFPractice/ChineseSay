//
//  UINavigationBar+Add.m
//  Test_Protocol
//
//  Created by 王林芳 on 2019/6/12.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "UINavigationBar+Add.h"

@implementation UINavigationBar (Add)
- (void)setColor:(UIColor *)color{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -20, self.bounds.size.width, kSystemStatusHeight + kSystemNavigationBarHeight)];
    view.backgroundColor = color;
    
    [self setValue:view forKey:@"backgroundView"];
}
- (void)setColor:(UIColor *)color showBottomLine:(BOOL)isShow{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -20, self.bounds.size.width, kSystemStatusHeight + kSystemNavigationBarHeight)];
    view.backgroundColor = color;
    if(isShow){
        UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight - 0.5, self.bounds.size.width, 0.5)];
        bottomLine.backgroundColor = [UIColor colorWithHex:0xDCDFE8];
        [view addSubview:bottomLine];
    }
    [self setValue:view forKey:@"backgroundView"];
}
@end
