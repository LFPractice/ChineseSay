//
//  CSHomeChineseMapController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/11.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeChineseMapController.h"

@interface CSHomeChineseMapController ()
@property (nonatomic, strong) UIImageView *img_map;
@end

@implementation CSHomeChineseMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor =[UIColor lightGrayColor];
    [self createUI];
}
- (void)createUI{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_controllerBg"]];
    [self.view addSubview:self.img_map];
}
#pragma mark - target action
- (void)gotoDetail{
    CSPageTypeModel *pageModel =[[CSPageTypeModel alloc]init];
    pageModel.action = CS_Page_Type_Action;
    pageModel.pageType = CS_Page_type_Home_ChineseMapDetail;
    [[CSPageTransfer shareInstance]dispatchTransFerActionWithPageModel:pageModel];
}
#pragma mark - lazy load
- (UIImageView *)img_map{
    if(!_img_map){
        _img_map = [[UIImageView alloc]init];
        _img_map.image = [UIImage imageNamed:@"home_map"];
        CGFloat scale = 310.0 / 355.0;
        _img_map.frame = CGRectMake(10, 180, (kScreenWidth - 20), (kScreenWidth - 20) * scale);
        _img_map.backgroundColor = [UIColor whiteColor];
        _img_map.layer.cornerRadius = 10;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoDetail)];
        [_img_map addGestureRecognizer:tap];
        _img_map.userInteractionEnabled = YES;
    }
    return _img_map;
}
@end
