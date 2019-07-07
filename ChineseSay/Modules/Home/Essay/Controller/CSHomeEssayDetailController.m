//
//  CSHomeEssayDetailController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/3.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeEssayDetailController.h"
#import "CSHomeEssayDetailModel.h"
@interface CSHomeEssayDetailController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *contentImg;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *hotWordsLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) CSHomeEssayDetailModel *model;
@end

@implementation CSHomeEssayDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentImg];
    [self.scrollView addSubview:self.titleLabel];
    [self.scrollView addSubview:self.hotWordsLabel];
    [self.scrollView addSubview:self.desLabel];
    
    [self loadData];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setWhiteBackItem];
}
- (void)loadData {
    [LFHttpTool home_getDataForEssayDetailParam:@{@"id":self.id.stringValue} Success:^(id responseObject) {
        NSNumber *code = responseObject[@"code"];
        if(code.integerValue == 200) {
            self.model = [CSHomeEssayDetailModel mj_objectWithKeyValues:responseObject[@"data"]];
            [self refreshData];
        }
    } Failure:^(NSError *error) {
        
    }];
}
- (void)refreshData {
    [self.contentImg sd_setImageWithURL:[NSURL URLWithString:self.model.image]];
    self.titleLabel.text = self.model.title;
    
    NSMutableString *hotWords = [[NSMutableString alloc]init];
    for (NSDictionary *dic in self.model.feedTags) {
        [hotWords appendString:[NSString stringWithFormat:@"%@   ",dic[@"name"]]];
    }
    
    self.hotWordsLabel.text = hotWords;
    
    self.desLabel.text = self.model.abstract;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat itemWidth = self.view.frame.size.width;
    CGFloat itemHeight = self.view.frame.size.height;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-(kSystemNavigationBarHeight + kSystemStatusHeight));
        make.left.with.bottom.mas_equalTo(0);
        make.width.mas_equalTo(itemWidth);
        make.height.mas_equalTo(1000);
    }];
    
    [self.contentImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.width.mas_equalTo(itemWidth);
        make.height.mas_equalTo((425 *(kScreenWidth / 375.0)));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.contentImg.mas_bottom).offset(15);
    }];
    [self.hotWordsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(17);
    }];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.hotWordsLabel.mas_bottom).offset(17);
        make.bottom.mas_equalTo(-36);
    }];

}
- (UIScrollView *)scrollView {
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}
- (UIImageView *)contentImg {
    if(!_contentImg) {
        _contentImg = [[UIImageView alloc]init];
    }
    return _contentImg;
}
- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:25];
        _titleLabel.textColor = [UIColor colorWithHex:0x333333];
        _titleLabel.text = @"How to use the Alipay (zhifubao)?";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (UILabel *)hotWordsLabel {
    if(!_hotWordsLabel) {
        _hotWordsLabel = [[UILabel alloc]init];
        _hotWordsLabel.font = [UIFont systemFontOfSize:15];
        _hotWordsLabel.textColor = [UIColor colorWithHex:0x555555];
        _hotWordsLabel.text = @"Alipay";
        _hotWordsLabel.numberOfLines = 0;
    }
    return _hotWordsLabel;
}
- (UILabel *)desLabel {
    if(!_desLabel) {
        _desLabel = [[UILabel alloc]init];
        _desLabel.font = [UIFont systemFontOfSize:15];
        _desLabel.textColor = [UIColor colorWithHex:0x555555];
        _desLabel.text = @"Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.";
        _desLabel.numberOfLines = 0;
    }
    return _desLabel;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end
