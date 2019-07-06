//
//  CSChieseGiftController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/6.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSChieseGiftController.h"
#import "CSMineGetGiftOrNameSuccessController.h"

@interface CSChieseGiftController ()
@property (weak, nonatomic) IBOutlet UIView *xingView;
@property (weak, nonatomic) IBOutlet UITextField *xingTF;
@property (weak, nonatomic) IBOutlet UIView *mingView;
@property (weak, nonatomic) IBOutlet UITextField *mingTF;
@property (weak, nonatomic) IBOutlet UIView *countryView;
@property (weak, nonatomic) IBOutlet UITextField *countryYF;
@property (weak, nonatomic) IBOutlet UIView *adressView;
@property (weak, nonatomic) IBOutlet UITextView *adressTV;
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UIButton *commiteBtn;

@end

@implementation CSChieseGiftController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
- (IBAction)commiteClick:(UIButton *)sender {
    if(self.xingTF.text.length == 0 ||
       self.mingTF.text.length == 0 ||
       self.phoneTF.text.length == 0 ||
       self.countryYF.text.length == 0 ||
       self.adressTV.text.length == 0 ) {
        [QMUITips showError:@"请填写完整信息"];
        return;
    }
    [LFHttpTool mine_chineseGiftWithParam:@{@"firstName":self.xingTF.text,
                                            @"lastName":self.mingTF.text,
                                            @"country":self.countryYF.text,
                                            @"phoneNumber":self.phoneTF.text,
                                            @"address":self.adressTV.text
                                            } Success:^(id responseObject) {
        NSNumber *code = responseObject[@"code"];
        if(code.integerValue == 200) {
            CSMineGetGiftOrNameSuccessController *successVC = [[CSMineGetGiftOrNameSuccessController alloc]init];
            //    successVC.titleStr = @"中国特色小礼物";
            successVC.titleLabel.text = @"中国特色小礼物";
            NSMutableArray *childVCArray = [[NSMutableArray alloc]initWithArray:self.navigationController.childViewControllers];
            successVC.hidesBottomBarWhenPushed = YES;
            [childVCArray replaceObjectAtIndex:(childVCArray.count - 1) withObject:successVC];
            [self.navigationController setViewControllers:childVCArray];
        }
    } Failure:^(NSError *error) {
        
    }];
    
}
- (void)createUI {
    
    self.xingView.layer.cornerRadius = 8;
    self.xingView.layer.masksToBounds = YES;
    
    self.mingView.layer.cornerRadius = 8;
    self.mingView.layer.masksToBounds = YES;
    
    self.countryView.layer.cornerRadius = 8;
    self.countryView.layer.masksToBounds = YES;
    
    self.adressView.layer.cornerRadius = 8;
    self.adressView.layer.masksToBounds = YES;
    
    self.phoneView.layer.cornerRadius = 8;
    self.phoneView.layer.masksToBounds = YES;
    
    self.commiteBtn.layer.cornerRadius = 20;
    self.commiteBtn.layer.borderColor = [UIColor colorWithHex:0x6C80A8].CGColor;
    self.commiteBtn.layer.borderWidth = 1;
    self.commiteBtn.layer.masksToBounds = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.xingTF resignFirstResponder];
    [self.mingTF resignFirstResponder];
    [self.countryYF resignFirstResponder];
    [self.phoneTF resignFirstResponder];
    [self.adressTV resignFirstResponder];
}
@end
