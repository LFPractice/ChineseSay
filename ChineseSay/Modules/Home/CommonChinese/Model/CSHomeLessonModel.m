//
//  CSHomeLessonModel.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/26.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeLessonModel.h"

@implementation CSHomeLessonModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"lessonDescription":@"description"
             };
}
@end
