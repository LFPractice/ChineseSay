//
//  CSMineUserInfoDetailController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineUserInfoDetailController.h"
#import "CSMineChangeInfoController.h"

@interface CSMineUserInfoDetailController ()
@property (weak, nonatomic) IBOutlet UIView *avaterView;
@property (weak, nonatomic) IBOutlet UIButton *btn_logOut;
@property (weak, nonatomic) IBOutlet UIImageView *avaterImg;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation CSMineUserInfoDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor colorWithHex:0xF4F5F9]];
    self.btn_logOut.layer.cornerRadius = 20;
    self.btn_logOut.layer.borderColor = [UIColor colorWithHex:0xF86565].CGColor;
    self.btn_logOut.layer.borderWidth = 1;
    [self.btn_logOut setTitleColor:[UIColor colorWithHex:0xF86565] forState:UIControlStateNormal];
    
    self.avaterImg.backgroundColor = [UIColor colorWithHex:0xB7BED1];
    self.avaterImg.layer.cornerRadius = 20;
    self.avaterImg.layer.masksToBounds = YES;
    [self updateInfo];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setColor:[UIColor whiteColor]];
    [self loadData];
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.avaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo((self.navigationController.navigationBar.translucent?(kSystemNavigationBarHeight + kSystemStatusHeight):0));
    }];
}
- (IBAction)btnTouXiangClick:(UIButton *)sender {
    GXPickerImageController*pickerVC=[[GXPickerImageController alloc]init];
    pickerVC.view.backgroundColor=[UIColor clearColor];//（一定要提前设置背景颜色为透明）
    __weak typeof(self)weakSelf = self;
    pickerVC.resultImage=^(NSData*imageData){
        //对imageData进行操作
        [weakSelf uploadImageData:imageData];
    };
    [self presentViewController:pickerVC animated:NO completion:nil];
}

- (IBAction)btnChangeInfoClick:(UIButton *)sender {
    CSMineChangeInfoController *changeInfoVC = [[CSMineChangeInfoController alloc]init];
    switch (sender.tag) {
        case 1:
        {
            // 昵称
            changeInfoVC.title = @"修改昵称";
            changeInfoVC.key = @"nickName";
            changeInfoVC.placeHolder = @"请输入昵称";
            break;
            
        }
        case 2:
        {
            // 生日
            changeInfoVC.title = @"修改生日";
            changeInfoVC.key = @"birthday";
            changeInfoVC.placeHolder = @"请输入生日";
            break;
            
        }
        case 3:
        {
            // 手机号
            changeInfoVC.title = @"修改手机号";
            changeInfoVC.key = @"phoneNumber";
            changeInfoVC.placeHolder = @"请输入手机号";
            break;
            
        }
        case 4:
        {
            // 邮箱
            changeInfoVC.title = @"修改邮箱";
            changeInfoVC.key = @"email";
            changeInfoVC.placeHolder = @"请输入邮箱";
            break;
            
        }
        default:
            break;
    }
    [self.navigationController pushViewController:changeInfoVC animated:YES];
}
- (IBAction)logoutClick:(UIButton *)sender {
    [CSUserInfoTool loginOut];
    [QMUITips showSucceed:@"退出登录成功"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)loadData{
    [LFHttpTool mine_getuserInfoWithParam:@{} Success:^(id responseObject) {
        NSNumber *code = responseObject[@"code"];
        if(code.integerValue == 200){
            self.userInfoModel = [CSUserInfoModel mj_objectWithKeyValues:responseObject[@"data"]];
            [self updateInfo];
        }
    } Failure:^(NSError *error) {
        
    }];
}

- (void)updateInfo{
    [self.avaterImg sd_setImageWithURL:[NSURL URLWithString:self.userInfoModel.headImage]];
    self.nickNameLabel.text = self.userInfoModel.userName.length > 0 ? self.userInfoModel.userName:@"未设置";
    self.birthdayLabel.text = self.userInfoModel.birthday.length > 0 ? self.userInfoModel.birthday:@"未设置";
    self.phoneLabel.text = self.userInfoModel.phoneNumber.length > 0 ? self.userInfoModel.phoneNumber:@"未设置";
    self.emailLabel.text = self.userInfoModel.email.length > 0 ? self.userInfoModel.email:@"未设置";
}
- (void)uploadImageData:(NSData *)imgData{
    [LFHttpTool mine_updateUserAvatarWithImageData:imgData Success:^(id responseObject) {
        NSNumber *code = responseObject[@"code"];
        if(code.integerValue == 200){
            NSString *imgUrlStr = responseObject[@"data"][@"url"];
            [LFHttpTool mine_updateUserInfoWithParam:@{@"avatar":imgUrlStr} Success:^(id responseObject) {
                [QMUITips hideAllTipsInView:self.view];
                NSNumber *code = responseObject[@"code"];
                if(code.integerValue == 200){
                    [QMUITips showInfo:@"修改成功"];
                    [self loadData];
                }
            } Failure:^(NSError *error) {
                [QMUITips hideAllTipsInView:self.view];
            }];
        }

    } Failure:^(NSError *error) {
        
    }];
}
@end
