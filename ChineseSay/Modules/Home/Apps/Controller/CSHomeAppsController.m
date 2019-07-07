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
#define leftDistance 10
@implementation CSHomeAppsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void)viewWillAppear:(BOOL)animated{
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithPatternImage:[UIImage imageWithColor:[UIColor colorWithHex:0x000000 alpha:0.4]]]];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
    [self setWhiteBackItem];
}
- (void)setPageModel:(CSPageTypeModel *)pageModel {
    [super setPageModel:pageModel];
    [self setTitle:pageModel.title Color:[UIColor whiteColor]];
}
#pragma mark - private
- (void)createUI{
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_controllerBg"]];
//    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
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
//    [self.view addSubview:pageView];
    
    UIView *bgView = [[UIView alloc]initWithFrame:self.view.bounds];
//    bgView.backgroundColor = [UIColor greenColor];
//    [bgView addSubview:pageView];
    [self.view addSubview:self.img_bg];
    
    [self.view addSubview:self.view_select];
    
//    self addChildViewController:sel
    [self addChildViewController:self.listVC_buy];
    [self.view addSubview:self.listVC_buy.view];
    self.listVC_buy.view.frame = CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight + 50, kScreenWidth, kScreenHeight - 30);
    
    [self addChildViewController:self.listVC_function];
    [self.view addSubview:self.listVC_function.view];
    self.listVC_function.view.frame = CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight + 50, kScreenWidth, kScreenHeight - 30);

    
    [self addChildViewController:self.listVC_amusement];
    [self.view addSubview:self.listVC_amusement.view];
    self.listVC_amusement.view.frame = CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight + 50, kScreenWidth, kScreenHeight - 30 );

    
}
#pragma mark - lazy load
- (CSHomeAppListSelectToolView *)view_select{
    if(!_view_select){
        _view_select = [[CSHomeAppListSelectToolView alloc]initWithFrame:CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight, kScreenWidth, 50)];
        __weak typeof(self)weakSelf = self;
        _view_select.selectBlock = ^(NSInteger tag) {
            for(UIViewController *controller in weakSelf.childViewControllers) {
                if([controller isKindOfClass:[CSHomeAppListController class]]) {
                    controller.view.hidden = YES;
                    if(controller.view.tag == tag) {
                        controller.view.hidden = NO;
                    }
                }
            }
        };
    }
    return _view_select;
}
- (CSHomeAppListController *)listVC_buy{
    if(!_listVC_buy){
        _listVC_buy = [[CSHomeAppListController alloc]init];
//        _listVC_buy.view.frame = CGRectMake(leftDistance, kSystemStatusHeight + kSystemNavigationBarHeight + 50, kScreenWidth - 2*leftDistance, kScreenHeight - kSystemStatusHeight + kSystemNavigationBarHeight - 50);
        _listVC_buy.catorgary = @(0);
        _listVC_buy.view.tag = 0;
        _listVC_buy.view.hidden = NO;
//        _listVC_buy.view.frame = CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight + 50, kScreenWidth, kScreenHeight - 50 - kSystemStatusHeight + kSystemNavigationBarHeight);
    }
    return _listVC_buy;
}
- (CSHomeAppListController *)listVC_function{
    if(!_listVC_function){
        _listVC_function = [[CSHomeAppListController alloc]init];
        _listVC_function.catorgary = @(1);
        _listVC_function.view.tag = 1;
        _listVC_function.view.hidden = YES;
//        _listVC_function.view.frame = CGRectMake(0, 134, kScreenWidth, kScreenHeight - 134);
    }
    return _listVC_function;
}
- (CSHomeAppListController *)listVC_amusement{
    if(!_listVC_amusement){
        _listVC_amusement = [[CSHomeAppListController alloc]init];
        _listVC_amusement.catorgary = @(2);
        _listVC_amusement.view.tag = 2;
        _listVC_amusement.view.hidden = YES;
//        _listVC_amusement.view.frame = CGRectMake(0, 134, kScreenWidth, kScreenHeight - 134);
    }
    return _listVC_amusement;
}
@end
