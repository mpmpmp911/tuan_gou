//
//  ChangeCityViewController.m
//  团购项目
//
//  Created by Cheryl on 5/5/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "ChangeCityViewController.h"
#import "cityGourpsModel.h"
#import "SearchCityResultViewController.h"
#import "UIView+AutoLayout.h"

@interface ChangeCityViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate> {
    NSArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UISearchBar *seachBar;
@property (strong,nonatomic) SearchCityResultViewController * searchResultVC;

@end

@implementation ChangeCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"切换城市";
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed: @"btn_navigation_close"] style:UIBarButtonItemStyleDone target:self action:@selector(backtoTC)];
    self.navigationItem.leftBarButtonItem = closeItem;
    // Do any additional setup after loading the view from its nib.
    cityGourpsModel *md = [[cityGourpsModel alloc] init];
    _dataArray = [md getModelArray];
}

- (void)backtoTC {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -table view datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return [[_dataArray objectAtIndex:section] cities].count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    cityGourpsModel *md = [_dataArray objectAtIndex:indexPath.section];
    cell.textLabel.text = md.cities[indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    cityGourpsModel *md = [_dataArray objectAtIndex:section];
    return md.title;
}

#pragma mark -table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    cityGourpsModel *md = [_dataArray objectAtIndex:indexPath.section];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cityDidChanged" object:nil userInfo:@{@"cityName":md.cities[indexPath.row]}];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.coverView.hidden = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    self.coverView.hidden = YES;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if(searchText.length) {
        self.searchResultVC.view.hidden = NO;
        self.searchResultVC.searchText = searchText;
    } else {
        self.searchResultVC.view.hidden = YES;
    }
    
}


#pragma mark - 创建搜索结果控制器
- (SearchCityResultViewController *)searchResultVC{
    //懒加载
    if (!_searchResultVC) {
        self.searchResultVC = [[SearchCityResultViewController alloc]init];
        //将搜索结果VC添加到当前控制器中
        [self.view addSubview:_searchResultVC.view];
        //添加约束 设置搜索结果控制器的尺寸位置
        [self.searchResultVC.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        //让searchResultVC的顶部 贴着搜索框的底部  不遮盖住搜索框
        [self.searchResultVC.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.seachBar];
    }
    return _searchResultVC;
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
