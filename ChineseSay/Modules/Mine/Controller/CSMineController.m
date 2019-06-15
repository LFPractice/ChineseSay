//
//  CSMineController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineController.h"
#import "CSMineDetailController.h"
@interface CSMineController ()
@property (nonatomic, strong) CSMineDetailController *detailVC;
@end

@implementation CSMineController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - private
- (void)createUI{
    [self.view addSubview:self.detailVC.view];
}

#pragma mark - lazy load
- (CSMineDetailController *)detailVC{
    if(!_detailVC){
        _detailVC = [[CSMineDetailController alloc]init];
    }
    return  _detailVC;
}
@end
