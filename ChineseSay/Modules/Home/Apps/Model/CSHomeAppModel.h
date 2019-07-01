//
//  CSHomeAppModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/30.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSHomeAppModel : NSObject
@property (nonatomic, strong) NSNumber *category;
@property (nonatomic, strong) NSString *lessonDescription;
@property (nonatomic, strong) NSString *howTo;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *name;
@end

NS_ASSUME_NONNULL_END
