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

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    popView *pv = [popView makePopView];
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

@end
