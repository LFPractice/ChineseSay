//
//  CSHomePlaceDetailModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/6.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSHomePlaceDetailModel : NSObject
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *shortDesc;
@property (nonatomic, strong) NSString *specialAudio;
@property (nonatomic, strong) NSString *specialNameEn;
@property (nonatomic, strong) NSString *specialNameZh;
@property (nonatomic, strong) NSString *specialPinyin;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *type;
@end

NS_ASSUME_NONNULL_END
