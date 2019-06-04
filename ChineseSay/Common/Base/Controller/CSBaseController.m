//
//  CSBaseController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseController.h"

@interface CSBaseController ()

@end

@implementation CSBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}

- (void)setPageModel:(CSPageTypeModel *)pageModel{
    _pageModel = pageModel;
    self.title = pageModel.title;
}

@end
