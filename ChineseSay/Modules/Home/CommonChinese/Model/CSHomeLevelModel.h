//
//  CSHomeLevelModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/25.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeLevelModel : NSObject
@property (nonatomic, copy)   NSNumber *id;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *levelImage;
@property (nonatomic, strong) NSString *levelName;
@end

NS_ASSUME_NONNULL_END
