//
//  CSPageTypeModel.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/4.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSPageTypeModel.h"

@implementation CSPageTypeModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pageType = nil;
        self.action = nil;
        self.exparam = nil;
        self.animated = YES;
    }
    return self;
}
@end
