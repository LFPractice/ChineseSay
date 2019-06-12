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
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -20, self.bounds.size.width, 64)];
    view.backgroundColor = color;
    
    [self setValue:view forKey:@"backgroundView"];
}
@end
