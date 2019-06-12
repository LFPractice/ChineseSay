//
//  CSHomeAppsController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeAppsController.h"
#import "CSHomeAppListController.h"
#import "CSHomeAppListSelectToolView.h"
@interface CSHomeAppsController ()
@property (nonatomic, strong) CSHomeAppListSelectToolView *view_select;
@property (nonatomic, strong) CSHomeAppListController *listVC_buy; // 购物类
@property (nonatomic, strong) CSHomeAppListController *listVC_function;// 实用类
@property (nonatomic, strong) CSHomeAppListController *listVC_amusement;// 娱乐类
@end

@implementation CSHomeAppsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithPatternImage:[UIImage imageWithColor:[UIColor colorWithHex:0x000000 alpha:0.4]]]];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
}
#pragma mark - private
- (void)createUI{
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_controllerBg"]];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
    NSArray *titles = @[@"购物类",@"实用类",@"娱乐类"];
    CGFloat y = 0;//kSystemNavigationBarHeight + kSystemStatusHeight;
    NinaPagerView *pageView = [[NinaPagerView alloc]initWithFrame:CGRectMake(0,y, kScreenWidth, kScreenHeight - y) WithTitles:titles WithVCs:@[self.listVC_buy,self.listVC_function,self.listVC_amusement]];
    pageView.unSelectTitleColor = [UIColor colorWithHex:0xffffff];
    pageView.selectTitleColor = [UIColor colorWithHex:0xFAB416];
    pageView.underlineColor = [UIColor colorWithHex:0x24c27d];
//    pageView.selectBottomLinePer = 0.1;
    pageView.ninaPagerStyles = NinaPagerStyleSlideBlock;
    pageView.underLineHidden = YES;
    pageView.sliderBlockColor = [UIColor whiteColor];
    pageView.topTabBackGroundColor = [UIColor colorWithHex:0xFAB416];
    [self.view addSubview:pageView];
    
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
}
#pragma mark - lazy load
- (CSHomeAppListSelectToolView *)view_select{
    if(!_view_select){
        _view_select = [[CSHomeAppListSelectToolView alloc]initWithFrame:CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight, kScreenWidth, 50)];
    }
    return _view_select;
}
- (CSHomeAppListController *)listVC_buy{
    if(!_listVC_buy){
        _listVC_buy = [[CSHomeAppListController alloc]init];
//        _listVC_buy.view.frame = CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight + 50, kScreenWidth, kScreenHeight - 50 - kSystemStatusHeight + kSystemNavigationBarHeight);
    }
    return _listVC_buy;
}
- (CSHomeAppListController *)listVC_function{
    if(!_listVC_function){
        _listVC_function = [[CSHomeAppListController alloc]init];
//        _listVC_function.view.frame = CGRectMake(0, 134, kScreenWidth, kScreenHeight - 134);
    }
    return _listVC_function;
}
- (CSHomeAppListController *)listVC_amusement{
    if(!_listVC_amusement){
        _listVC_amusement = [[CSHomeAppListController alloc]init];
//        _listVC_amusement.view.frame = CGRectMake(0, 134, kScreenWidth, kScreenHeight - 134);
    }
    return _listVC_amusement;
}
@end
