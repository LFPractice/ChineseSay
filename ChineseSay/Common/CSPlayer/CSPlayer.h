//
//  CSPlayer.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/25.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSPlayer : NSObject
@property (nonatomic, copy) void(^readyToPlayBlock)();
+ (instancetype)sharedInstance;
- (void)playWithUrlStr:(NSString *)urlString;
- (void)play;
- (void)pause;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
