//
//  CSRegisterController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/1.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSRegisterController.h"

@interface CSRegisterController ()<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView *headImg;
@property (nonatomic, strong) UITextField *userAccountTF;
@property (nonatomic, strong) UITextField *vertyCodeTF;
@property (nonatomic, strong) UITextField *passworldTF;
@property (nonatomic, strong) UITextField *confirmTF;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registButton;
@property (nonatomic, strong) UIButton *vertyCodeButton;
@property (nonatomic, strong) UIButton *closeBtn;
@end

@implementation CSRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)getVertiCodeClick{
    [self.vertyCodeButton turnModeForSendVertyCodeWithTimeInterval:15];
}
- (void)closeClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)registerClick{
    if(self.userAccountTF.text.length == 0||
       self.passworldTF.text.length == 0||
       self.vertyCodeTF.text.length == 0){
        [QMUITips showError:@"请填写完整的信息"];
        return;
    }
    
    if(![self.confirmTF.text isEqualToString:self.passworldTF.text]){
        [QMUITips showError:@"两次输入的密码不一致"];
        return;
    }
    NSDictionary *params = @{@"account":self.userAccountTF.text,
                             @"code":self.vertyCodeTF.text,
                             @"password":self.passworldTF.text
                             };
    [LFHttpTool mine_registWithParam:params Success:^(id responseObject) {
        NSNumber *code = responseObject[@"code"];
        if(code.integerValue == 200){
            [QMUITips showSucceed:@"注册成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            });
        }
        else{
            [QMUITips showError:responseObject[@"message"]];
        }
    } Failure:^(NSError *error) {
        
    }];
}
- (void)createUI{
    UIImageView *backGroundImg = [[UIImageView alloc]init];
    backGroundImg.image = [UIImage imageNamed:@"common_controllerBg"];
    backGroundImg.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:backGroundImg];
    
    [self.view addSubview:self.headImg];
    [self.view addSubview:self.userAccountTF];
    [self.view addSubview:self.vertyCodeTF];
    [self.view addSubview:self.passworldTF];
    [self.view addSubview:self.registButton];
    [self.view addSubview:self.vertyCodeButton];
    
    [self.view addSubview:self.confirmTF];
    
    [self.view addSubview:self.closeBtn];
    
    [self csLayoutSubviews];
    
}
- (void)csLayoutSubviews{
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo((kSystemStatusHeight + kSystemNavigationBarHeight));
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(68);
        make.centerX.mas_equalTo(0);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(kSystemStatusHeight);
        make.width.height.mas_equalTo(30);
    }];
    
    [self.userAccountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.headImg.mas_bottom).offset(90);
    }];
    
    [self.vertyCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.userAccountTF.mas_bottom).offset(10);
    }];
    [self.passworldTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.vertyCodeTF.mas_bottom).offset(10);
    }];
    
    [self.vertyCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.vertyCodeTF.mas_right).offset(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo (100);
        make.centerY.mas_equalTo(self.vertyCodeTF.mas_centerY).offset(0);
    }];
    [self.confirmTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.passworldTF.mas_bottom).offset(10);
    }];
    [self.registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.confirmTF.mas_bottom).offset(50);
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (UIImageView *)headImg{
    if(!_headImg){
        _headImg = [[UIImageView alloc]init];
        _headImg.image = [UIImage imageNamed:@"login_header"];
    }
    return _headImg;
}
- (UITextField *)userAccountTF{
    if(!_userAccountTF){
        _userAccountTF = [[UITextField alloc]init];
        _userAccountTF.placeholder = @"Username";
        _userAccountTF.backgroundColor = [UIColor whiteColor];
        _userAccountTF.layer.cornerRadius = 20;
        _userAccountTF.layer.masksToBounds = YES;
        _userAccountTF.delegate = self;
        _userAccountTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
        _userAccountTF.leftViewMode = UITextFieldViewModeAlways;
    }
    return _userAccountTF;
}
- (UITextField *)vertyCodeTF{
    if(!_vertyCodeTF){
        _vertyCodeTF = [[UITextField alloc]init];
        _vertyCodeTF.placeholder = @"vertification Code";
        _vertyCodeTF.backgroundColor = [UIColor whiteColor];
        _vertyCodeTF.layer.cornerRadius = 20;
        _vertyCodeTF.layer.masksToBounds = YES;
        _vertyCodeTF.delegate = self;
        _vertyCodeTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
        _vertyCodeTF.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _vertyCodeTF ;
}
- (UITextField *)passworldTF{
    if(!_passworldTF){
        _passworldTF = [[UITextField alloc]init];
        _passworldTF.placeholder = @"Passworld";
        _passworldTF.backgroundColor = [UIColor whiteColor];
        _passworldTF.layer.cornerRadius = 20;
        _passworldTF.layer.masksToBounds = YES;
        _passworldTF.secureTextEntry = YES;
        _passworldTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
        _passworldTF.leftViewMode = UITextFieldViewModeAlways;
        _passworldTF.delegate = self;
        
    }
    return _passworldTF;
}

- (UITextField *)confirmTF{
    if(!_confirmTF){
        _confirmTF = [[UITextField alloc]init];
        _confirmTF.placeholder = @"Re - enter Password";
        _confirmTF.backgroundColor = [UIColor whiteColor];
        _confirmTF.layer.cornerRadius = 20;
        _confirmTF.layer.masksToBounds = YES;
        _confirmTF.secureTextEntry = YES;
        _confirmTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
        _confirmTF.leftViewMode = UITextFieldViewModeAlways;
        _confirmTF.delegate = self;
        
    }
    return _confirmTF;
}

- (UIButton *)closeBtn {
    if(!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setImage:[UIImage imageNamed:@"nav_global_back_white"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}
- (UIButton *)loginButton{
    if(!_loginButton){
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"Log in" forState:UIControlStateNormal];
//        [_loginButton addTarget:self action:@selector(logClick) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton setBackgroundColor:[UIColor colorWithHex:0x6C80A8]];
        _loginButton.layer.cornerRadius = 20;
    }
    return _loginButton;
}
- (UIButton *)registButton{
    if(!_registButton){
        _registButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registButton setTitle:@"Register" forState:UIControlStateNormal];
        [_registButton addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
        [_registButton setBackgroundColor:[UIColor colorWithHex:0x6C80A8]];
        _registButton.layer.cornerRadius = 20;
    }
    return _registButton;
}
- (UIButton *)vertyCodeButton{
    if(!_vertyCodeButton){
        _vertyCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_vertyCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _vertyCodeButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_vertyCodeButton addTarget:self action:@selector(getVertiCodeClick) forControlEvents:UIControlEventTouchUpInside];
        [_vertyCodeButton setTitleColor:[UIColor colorWithHex:0x6C80A8] forState:UIControlStateNormal];
    }
    return _vertyCodeButton;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end
