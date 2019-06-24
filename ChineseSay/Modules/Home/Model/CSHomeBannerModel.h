//
//  CSHomeBannerModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/24.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeBannerModel : NSObject
@property (nonatomic, strong) NSNumber *category;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *key;
@end

NS_ASSUME_NONNULL_END
