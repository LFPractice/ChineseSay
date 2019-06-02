//
//  Const.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#ifndef Const_h
#define Const_h
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kCurrentDeviceiPhone5          (kScreenHeight == 568)
#define kCurrentDeviceiPhone6P         (kScreenHeight  == 414)
#define kCurrentDeviceiPhone6          (kScreenHeight  == 375)
#define kCurrentDeviceiPhoneX_XS       (kScreenHeight == 812)
#define kCurrentDeviceiPhoneXR_XSMax   (kScreenHeight == 896)

#define kCurrentDeviceIsFullScreen     (kCurrentDeviceiPhoneX_XS || kCurrentDeviceiPhoneXR_XSMax)

#define kSystemNavigationBarHeight 44.0f//导航栏高度
#define kSystemStatusHeight  (kCurrentDeviceIsFullScreen ? 44.0f : 20.0f)//状态栏高度
#define kSystemBottomHeight  (kCurrentDeviceIsFullScreen ? 34.0  : 0.0)//iphone x底部需要预留34高度
#define kSystemTabBarHeight  (kCurrentDeviceIsFullScreen ? 83.0f : 49.0f)//tabbar高度
#define kXStatusBarIncrease  (kCurrentDeviceIsFullScreen ? 24.f  : 0)//x多出
#endif /* Const_h */
