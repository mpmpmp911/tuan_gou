//
//  PopViewController.m
//  团购项目
//
//  Created by ming_du1 on 4/28/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "PopViewController.h"
#import "popView.h"
#import "CatogriyModel.h"

@interface PopViewController()<MypopViewDelegate,MypopViewDataSource>
@property (strong,nonatomic) CatogriyModel * selectedMode;
@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    popView *pv = [popView makePopView];
    pv.dataSource = self;
    pv.delegate = self;
    [self.view addSubview:pv];
    pv.categriyArr = [self getData];
    //不知道为什么 这一句必须有 否则现实不出来数据，不走(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 这个方法
    pv.autoresizingMask = UIViewAutoresizingNone;
    
    self.preferredContentSize = CGSizeMake(pv.frame.size.width, pv.frame.size.height);
}

//获取 分类下拉菜单的数据
- (NSArray *)getData {
    CatogriyModel *md = [[CatogriyModel alloc] init];
    NSArray *arr = [md loadPlistData];
    return arr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//左表 行数
- (NSInteger)numberOfRowsinLeftTableView:(popView *)popView{
    return [self getData].count ;
}
//左表 标题
- (NSString *)popView:(popView *)popView titleForRow:(NSInteger)row{
    return [[self getData][row] name];
}

//左表 图标
- (NSString *)popView:(popView *)popView imageForRow:(NSInteger)row{
    return [[self getData][row] small_icon];
}
//左表 子数据
- (NSArray *)popView:(popView *)popView subDataForRow:(NSInteger)row{
    return [[self getData][row] subcategories];;
}

//选择左侧表时调用
- (void)leftpopView:(popView *)popView didSelectRowAtIndexPath:(NSInteger)row {
    //选择了popview的左侧表格
    NSArray *categoryArr = [self getData];
    _selectedMode = categoryArr[row];
    //有没有子数据
    if (!_selectedMode.subcategories.count) {
        //发送通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"categoryDidChanged" object:nil userInfo:@{@"categoryModel":_selectedMode}];
    }
}
//选择右侧表时调用
- (void)rightpopView:(popView *)popView didSelectRowAtIndexPath:(NSInteger)row{
    NSArray *subArr = _selectedMode.subcategories;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"subCategoryDidChanged" object:nil userInfo:@{@"categoryModel":_selectedMode,@"subCategoryName":subArr[row]}];
}

@end
