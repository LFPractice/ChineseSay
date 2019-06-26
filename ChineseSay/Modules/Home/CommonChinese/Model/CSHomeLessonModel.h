//
//  CSHomeLessonModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/26.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeLessonModel : CSBaseView
@property (nonatomic, copy) NSString *lessonDescription;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, strong) NSString *lessonTitle;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *thumbImage;
@end

NS_ASSUME_NONNULL_END
