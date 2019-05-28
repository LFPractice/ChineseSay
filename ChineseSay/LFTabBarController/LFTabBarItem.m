//
//  LFTabBarItem.m
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/9.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import "LFTabBarItem.h"
static NSInteger defaultTag = 100000;
@interface LFTabBarItem()
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@end

@implementation LFTabBarItem
- (instancetype)init{
    self = [super init];
    if(self){
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemClick:)];
        [self addGestureRecognizer:tap];
    }
    
    return self;
}
- (void)setTag:(NSInteger)tag{
    [super setTag:tag + defaultTag];
}
- (UIImageView *)iconImageView{
    if(_iconImageView == nil){
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageView];
    }
    
    return _iconImageView;
}
- (UILabel *)titleLabel{
    if(_titleLabel == nil){
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor grayColor];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (void)setIcon:(NSString *)icon{
    _icon = icon;
    self.iconImageView.image = [UIImage imageNamed:icon];
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}
- (void)setTitleColor:(UIColor *)titleColor{
    self.titleLabel.textColor = titleColor;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat space = 6.0;
    if(self.icon.length > 0 && self.title.length > 0){
        CGFloat iconHeight = (49 - space * 3)*2/3.0;
        self.iconImageView.frame = CGRectMake(space, space, CGRectGetWidth(self.frame) - 2 * space, iconHeight);
        self.titleLabel.frame = CGRectMake(space, CGRectGetMaxY(self.iconImageView.frame) + space, CGRectGetWidth(self.frame) - 2*space, iconHeight/2.0);
    }else if(self.icon.length > 0){
        
        self.iconImageView.frame = CGRectMake(2, 2, CGRectGetWidth(self.frame) - 4, CGRectGetHeight(self.frame) - 4);
    }else if(self.title.length > 0){
        
        self.titleLabel.frame = CGRectMake(2, CGRectGetHeight(self.frame) - 22, CGRectGetWidth(self.frame) - 4, 20);
    }
}
- (void)itemClick:(UIPanGestureRecognizer *)tap{
    if(self.delegate && [self.delegate respondsToSelector:@selector(tabBarItem:didSelectIndex:)]){
        
        [self.delegate tabBarItem:self didSelectIndex:self.tag - defaultTag];
    }
}
@end
