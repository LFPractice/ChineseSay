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
@property (nonatomic, strong) NSMutableArray *dataSource;
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
    
    [self loadData];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setColor: [UIColor clearColor]];
    [self setWhiteBackItem];
}
- (void)loadData {
    [LFHttpTool home_getDataForEssayListParam:@{@"query":self.query} Success:^(id responseObject) {
        NSNumber *code = responseObject[@"code"];
        if(code.integerValue == 200) {
            self.dataSource = [[NSMutableArray alloc]initWithArray:[CSHomeEssayListModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]]];
            [self.tableView reloadData];
        }
    } Failure:^(NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 187;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CSHomeEssayItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSHomeEssayItemCell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.searchBar resignFirstResponder];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CSHomeEssayListModel *model = self.dataSource[indexPath.row];
    CSHomeEssayDetailController *vc = [[CSHomeEssayDetailController alloc] init];
    vc.id = model.id;
    [self.navigationController pushViewController:vc animated:YES];
}
//- sear

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    return YES;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.query = searchText;
    [self loadData];
    
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-20, kScreenHeight) style:UITableViewStylePlain];
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
//        _searchBar.layer.cornerRadius = 15;
        _searchBar.layer.masksToBounds = YES;
        _searchBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
        _searchBar.delegate = self;
        
        
        UIButton*cancelBtn = [_searchBar valueForKey:@"cancelButton"];
        
        cancelBtn.enabled =YES;
        
        [titleView addSubview:_searchBar];
        self.navigationItem.titleView = titleView;
    }
    return _searchBar;
}
- (NSString *)query {
    if(!_query) {
        _query = [[NSString alloc]init];
    }
    return _query;
}
- (NSMutableArray *)dataSource {
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
@end
