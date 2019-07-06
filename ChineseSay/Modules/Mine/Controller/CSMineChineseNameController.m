//
//  CSMineChineseNameController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/6.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineChineseNameController.h"
#import "CSMineGetGiftOrNameSuccessController.h"
@interface CSMineChineseNameController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet UIView *textViewBG;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIView *textFieldBG;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@end

@implementation CSMineChineseNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
- (IBAction)commitClick:(UIButton *)sender {
    
    if(self.textField.text.length == 0 || self.textView.text.length == 0) {
        [QMUITips showError:@"请填写完整信息"];
        return;
    }
    [LFHttpTool mine_designChinesesNameWithParam:@{@"email":self.textField.text,
                                                   @"info":self.textView.text}
                                         Success:^(id responseObject) {
                                             NSNumber *code = responseObject[@"code"];
                                             if(code.integerValue == 200) {
                                                 CSMineGetGiftOrNameSuccessController *successVC = [[CSMineGetGiftOrNameSuccessController alloc]init];
                                                 successVC.titleLabel.text = @"免费定制中文名";
                                                 NSMutableArray *childVCArray = [[NSMutableArray alloc]initWithArray:self.navigationController.childViewControllers];
                                                 successVC.hidesBottomBarWhenPushed = YES;
                                                 [childVCArray replaceObjectAtIndex:(childVCArray.count - 1) withObject:successVC];
                                                 [self.navigationController setViewControllers:childVCArray];
                                             }
                                                   }
                                         Failure:^(NSError *error) {
                                                       
                                                   }];
    
    
}
- (void)createUI {
    self.textViewBG.layer.cornerRadius = 8;
    self.textFieldBG.layer.cornerRadius = 8;
    self.commitBtn.layer.cornerRadius = 20;
    self.commitBtn.layer.borderWidth = 1;
    self.commitBtn.layer.borderColor = [UIColor colorWithHex:0x6C80A8].CGColor;
    self.commitBtn.layer.masksToBounds = YES;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo((self.navigationController.navigationBar.isTranslucent?(kSystemNavigationBarHeight + kSystemStatusHeight + 40):40));
    }];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(40);
    }];
    
    [self.textViewBG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(self.desLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(120);
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
    }];
    
    [self.emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(self.textViewBG.mas_bottom).offset(20);
    }];
    [self.textFieldBG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.emailLabel.mas_right).offset(3);
        make.right.mas_equalTo(-30);
        make.centerY.mas_equalTo(self.emailLabel.mas_centerY).offset(0);
        make.height.mas_equalTo(40);
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
    }];
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(self.textFieldBG.mas_bottom).offset(58);
        make.height.mas_equalTo(40);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
    [self.textView resignFirstResponder];
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
