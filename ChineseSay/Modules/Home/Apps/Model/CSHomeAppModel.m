//
//  CSHomeAppModel.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/30.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeAppModel.h"

@implementation CSHomeAppModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"lessonDescription":@"description"
             };
}
@end
