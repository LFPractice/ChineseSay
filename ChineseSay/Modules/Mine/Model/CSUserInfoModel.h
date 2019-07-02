//
//  CSUserInfoModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/1.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSUserInfoModel : NSObject
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *background;
@property (nonatomic, strong) NSArray *banners;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSNumber *couponCount;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *headImage;
@property (nonatomic, copy)   NSNumber *id;
@property (nonatomic, strong) NSNumber *messageCount;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSNumber *score;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSNumber *vipLeft;

@end

NS_ASSUME_NONNULL_END
