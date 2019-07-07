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
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-300, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [self setWhiteBackItem];
}
- (void)viewWillAppear:(BOOL)animated {
    [self setBlackBackItem];
}
- (void)createUI {
    
}
- (void)setBlackBackItem {

    self.navigationController.navigationBar.tintColor =
    [UIColor colorWithHex:0x333333];
}
- (void)setWhiteBackItem {
    self.navigationController.navigationBar.tintColor =
    [UIColor colorWithHex:0xffffff];
}

- (void)setBackItemWithImg:(UIImage *)img {
    /*
    NSString *version= [UIDevice currentDevice].systemVersion;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 22, 44);
    [leftBtn setBackgroundImage:img forState:UIControlStateNormal];
    if (version.doubleValue < 11.0) {
        leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -5 * kScreenWidth /375.0,0,0)];
    }
    [leftBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    self.navigationItem.leftBarButtonItems = @[leftBarBtn];
    */
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    self.navigationController.navigationBar.tintColor =
    [UIColor colorWithRed:0.99 green:0.50 blue:0.09 alpha:1.00];
    //主要是以下两个图片设置
    self.navigationController.navigationBar.backIndicatorImage = img;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = img;
    self.navigationItem.backBarButtonItem = backItem;
}
- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setTitle:(NSString *)title Color:(UIColor *)color {
    CGSize fitSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 200, 44);
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = color ? : [UIColor blackColor];
    CGSize size = [titleLabel sizeThatFits:fitSize];
    CGFloat titleWidth = MIN(size.width, fitSize.width);
    titleLabel.frame = CGRectMake(0, 0, titleWidth, fitSize.height);
    
    titleLabel.tintColor = [UIColor redColor];
    //    titleLabel.backgroundColor = [UIColor redColor];
    
    [self setTitleView:titleLabel];
}

- (void)setTitleView:(UIView *)titleView {
    self.navigationItem.titleView = titleView;
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
