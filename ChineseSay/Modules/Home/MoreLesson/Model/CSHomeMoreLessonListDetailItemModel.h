//
//  SCHomeMoreLessonListDetailItemModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/25.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeMoreLessonListDetailItemModel : NSObject
@property (nonatomic, strong) NSString *audio;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, copy)   NSNumber *id;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@end

NS_ASSUME_NONNULL_END
