//
//  CSHomeDataSource.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSHomeBackgroundModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CSHomeDataSource : NSObject
+ (instancetype)shareInstance;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableDictionary *dic_background;
@property (nonatomic, copy) void(^refreshData)();

- (void)loadDataForHome;
@end

NS_ASSUME_NONNULL_END
