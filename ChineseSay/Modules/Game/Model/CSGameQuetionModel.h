//
//  CSGameQuetionModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSGameQuetionModel : NSObject
@property (nonatomic, strong) NSArray *answers;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, strong) NSString *title;
@end

NS_ASSUME_NONNULL_END
