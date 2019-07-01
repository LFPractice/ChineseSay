//
//  CSMineController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineController.h"
#import "CSMineDetailController.h"
#import "CSLoginController.h"
@interface CSMineController ()
@property (nonatomic, strong) CSMineDetailController *detailVC;
@property (nonatomic, strong) CSLoginController *logingVC;
@end

@implementation CSMineController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [self createUI];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - private
- (void)createUI{
    if([CSUserInfoTool isLogin]){
        [self.logingVC.view removeFromSuperview];
        [self.view addSubview:self.detailVC.view];
    }else{
        [self.detailVC.view removeFromSuperview];
        [self.view addSubview:self.logingVC.view];
    }
}

#pragma mark - lazy load
- (CSMineDetailController *)detailVC{
    if(!_detailVC){
        _detailVC = [[CSMineDetailController alloc]init];
    }
    return  _detailVC;
}
- (CSLoginController *)logingVC{
    if(!_logingVC){
        _logingVC = [[CSLoginController alloc]init];
        
        __weak typeof(self)weakSelf = self;
        _logingVC.loginSuccess = ^{
            [weakSelf createUI];
        };
    }
    return _logingVC;
}
@end
