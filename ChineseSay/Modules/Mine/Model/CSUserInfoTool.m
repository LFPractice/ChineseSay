//
//  CSUserInfoTool.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/30.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSUserInfoTool.h"

@implementation CSUserInfoTool
+ (BOOL)isLogin{
    return [CSUserDefaults boolForKey:loginStatus];
}
+ (void)loginSuccessWithObject:(id)responseObject{
    [CSUserDefaults setBool:YES forKey:loginStatus];
    [CSUserDefaults setObject:responseObject[@"data"][@"token"] forKey:CSUserToken];
}
+ (void)loginOut{
    [CSUserDefaults removeObjectForKey:loginStatus];
}
+ (NSString *)userToken{
    return [CSUserDefaults objectForKey:CSUserToken];
}
@end
