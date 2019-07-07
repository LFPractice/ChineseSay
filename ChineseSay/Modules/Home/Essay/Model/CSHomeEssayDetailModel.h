//
//  CSHomeEssayDetailModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/7.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeEssayDetailModel : NSObject
@property (nonatomic, strong) NSString *abstract;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSArray *feedTags;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *title;

@end

NS_ASSUME_NONNULL_END
