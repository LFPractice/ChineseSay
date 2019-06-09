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
//    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
//    self.navigationController.navigationBar.translucent = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
//    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}

#pragma mark - private
- (void)createUI{
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.view_select];
    [self.view addSubview:self.listVC_buy.view];
}
#pragma mark - lazy load
- (CSHomeAppListSelectToolView *)view_select{
    if(!_view_select){
        _view_select = [[CSHomeAppListSelectToolView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    }
    return _view_select;
}
- (CSHomeAppListController *)listVC_buy{
    if(!_listVC_buy){
        _listVC_buy = [[CSHomeAppListController alloc]init];
        _listVC_buy.view.frame = CGRectMake(0, 50, kScreenWidth, kScreenHeight - 50);
    }
    return _listVC_buy;
}
- (CSHomeAppListController *)listVC_function{
    if(!_listVC_function){
        _listVC_function = [[CSHomeAppListController alloc]init];
        _listVC_function.view.frame = CGRectMake(0, 134, kScreenWidth, kScreenHeight - 134);
    }
    return _listVC_function;
}
- (CSHomeAppListController *)listVC_amusement{
    if(!_listVC_amusement){
        _listVC_amusement = [[CSHomeAppListController alloc]init];
        _listVC_amusement.view.frame = CGRectMake(0, 134, kScreenWidth, kScreenHeight - 134);
    }
    return _listVC_amusement;
}
@end
