//
//  CSBaseController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseController.h"

@interface CSBaseController ()

@end

@implementation CSBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:self.img_bg];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [self.view addSubview:self.view_navigationBar];
    // Do any additional setup after loading the view.
}
- (void)createUI {
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
- (void)setPageModel:(CSPageTypeModel *)pageModel{
    _pageModel = pageModel;
    self.title = pageModel.title;
}
- (UIView *)view_navigationBar{
    if(!_view_navigationBar){
        _view_navigationBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kSystemStatusHeight+ kSystemNavigationBarHeight)];
        _view_navigationBar.backgroundColor = [UIColor blueColor];
    }
    return _view_navigationBar;
}
- (UIImageView *)img_bg{
    if(!_img_bg){
        _img_bg =[[UIImageView alloc]init];
        _img_bg.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _img_bg.image =[UIImage imageNamed:@"common_controllerBg"];
    }
    return _img_bg;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
@end
