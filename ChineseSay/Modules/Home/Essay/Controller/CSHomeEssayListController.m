//
//  CSHomeEssayListController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/3.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeEssayListController.h"
#import "CSHomeEssayItemCell.h"
#import "CSHomeEssayDetailController.h"
@interface CSHomeEssayListController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation CSHomeEssayListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self searchBar];
    
    UIImageView *img_bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    img_bg.image = [UIImage imageNamed:@"common_controllerBg"];
    [self.view addSubview:self.img_bg];
    [self.view addSubview:self.tableView];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setColor: [UIColor clearColor]];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 187;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CSHomeEssayItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSHomeEssayItemCell"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CSHomeEssayDetailController *vc = [[CSHomeEssayDetailController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"CSHomeEssayItemCell" bundle:nil] forCellReuseIdentifier:@"CSHomeEssayItemCell"];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}
- (UISearchBar *)searchBar {
    if(!_searchBar) {
        
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 100, 30)];
        titleView.layer.cornerRadius = 15;
        titleView.layer.masksToBounds = YES;
        titleView.backgroundColor = [UIColor clearColor];
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 100, 30)];
        _searchBar.placeholder = @"search";
        _searchBar.layer.cornerRadius = 15;
        _searchBar.layer.masksToBounds = YES;
        _searchBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
        _searchBar.delegate = self;
        
        [titleView addSubview:_searchBar];
        self.navigationItem.titleView = titleView;
    }
    return _searchBar;
}
@end
