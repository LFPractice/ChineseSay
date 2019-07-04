//
//  CSMineJiFenShopController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/4.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineJiFenShopController.h"

@interface CSMineJiFenShopController ()
@property (weak, nonatomic) IBOutlet UIImageView *headerBgImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *getScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *nextImg;

@end

@implementation CSMineJiFenShopController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
- (void)viewWillLayoutSubviews{
    [self.headerBgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo((self.navigationController.navigationBar.translucent?(0):-(kSystemNavigationBarHeight + kSystemStatusHeight)));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(184);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerBgImg.mas_top).offset(30);
        make.centerX.mas_equalTo(0);
    }];
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15);
        make.centerX.mas_equalTo(0);
    }];
    [self.getScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scoreLabel.mas_bottom).offset(14);
        make.centerX.mas_equalTo(0);
    }];
    [self.nextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.getScoreLabel.mas_right).offset(8);
        make.centerY.mas_equalTo(self.getScoreLabel.mas_centerY).offset(0);
        make.width.mas_equalTo(11);
        make.height.mas_equalTo(11);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
