//
//  CSMineChangeInfoController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineChangeInfoController.h"

@interface CSMineChangeInfoController ()
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UITextField *contentTF;

@end

@implementation CSMineChangeInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.confirmBtn.layer.cornerRadius = 20;
    self.confirmBtn.layer.borderColor = [UIColor colorWithHex:0xF86565].CGColor;
    self.confirmBtn.layer.borderWidth = 1;
    [self.confirmBtn setTitleColor:[UIColor colorWithHex:0xF86565] forState:UIControlStateNormal];
    
    self.contentTF.placeholder = self.placeHolder;
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo((self.navigationController.navigationBar.translucent?(kSystemNavigationBarHeight + kSystemStatusHeight + 10):10));
    }];
}
- (IBAction)commiteClick:(UIButton *)sender {
    if(self.contentTF.text.length == 0){
        [QMUITips showError:self.placeHolder];
        return;
    }
    [QMUITips showLoadingInView:self.view];
    [LFHttpTool mine_updateUserInfoWithParam:@{self.key:self.contentTF.text} Success:^(id responseObject) {
        [QMUITips hideAllTipsInView:self.view];
        NSNumber *code = responseObject[@"code"];
        if(code.integerValue == 200){
            [QMUITips showInfo:@"修改成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
    } Failure:^(NSError *error) {
        [QMUITips hideAllTipsInView:self.view];
    }];
}

@end
