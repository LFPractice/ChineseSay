//
//  CSMineGetGiftOrNameSuccessController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/6.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineGetGiftOrNameSuccessController.h"

@interface CSMineGetGiftOrNameSuccessController ()

@property (weak, nonatomic) IBOutlet UIButton *goOnButton;

@end

@implementation CSMineGetGiftOrNameSuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createUI];
}
- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}
- (IBAction)goOnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)createUI {
    self.goOnButton.layer.cornerRadius = 20;
    self.goOnButton.layer.borderColor = [UIColor colorWithHex:0x6C80A8].CGColor;
    self.goOnButton.layer.borderWidth = 1;
    self.goOnButton.layer.masksToBounds = YES;
}


@end
