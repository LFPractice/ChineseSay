//
//  CSGameQuestionItemModel.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSGameQuestionItemModel : NSObject
@property (nonatomic, strong) NSString *content;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, assign) BOOL isCorrect;
@property (nonatomic, strong) NSString *option;
@end

NS_ASSUME_NONNULL_END
