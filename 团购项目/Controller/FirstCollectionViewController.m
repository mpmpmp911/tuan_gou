//
//  FirstCollectionViewController.m
//  团购项目
//
//  Created by ming_du1 on 4/27/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "FirstCollectionViewController.h"
#import "NavBarItem.h"
#import "PopViewController.h"
#import "SecondPopViewController.h"
#import "CatogriyModel.h"
#import "DPAPI.h"
#import "Cities.h"
#import "dealModel.h"


@interface FirstCollectionViewController ()<DPRequestDelegate> {
    
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    UIBarButtonItem *thirdItem;
    
    NSString *_selectedCityName;
    NSString *_selectedCategory;

}
@end

@implementation FirstCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(categoryChange:) name:@"categoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subCategoryChange:) name:@"subCategoryDidChanged" object:nil];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChange:) name:@"cityDidChanged" object:nil];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)cityChange:(NSNotification*)noti{
    _selectedCityName =  noti.userInfo[@"cityName"];
    
    //发送网络请求
    [self createRequest];
}


- (void)categoryChange:(NSNotification*)noti{
    CatogriyModel *md = (CatogriyModel*)noti.userInfo[@"categoryModel"];
    NSLog(@"左表：%@",md.name);
    _selectedCategory = md.name;
    
    //发送网络请求
    [self createRequest];
    
    
}

- (void)subCategoryChange:(NSNotification*)noti{
    CatogriyModel *md = (CatogriyModel*)noti.userInfo[@"categoryModel"];
    NSString *str = noti.userInfo[@"subCategoryName"];
    NSLog(@"左表：%@",md.name);
    NSLog(@"从表%@",str);
    if (!md.subcategories.count) {
        _selectedCategory = md.name;
    } else {
        if ([str isEqualToString:@"全部"]) {
            _selectedCategory = md.name;
        } else {
            _selectedCategory = str;
        }
    }
    //发送网络请求
    [self createRequest];
}

#pragma mark - 网络请求
- (void)createRequest{
    DPAPI *api = [[DPAPI alloc]init];
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:_selectedCityName forKey:@"city"];
    [params setValue:_selectedCategory forKey:@"category"];
    [api requestWithURL:@"v1/deal/find_deals" params:params delegate:self];
}

//- (void)request:(DPRequest *)request didReceiveResponse:(NSURLResponse *)response {
//    
//}
//- (void)request:(DPRequest *)request didReceiveRawData:(NSData *)data {
//    
//}
- (void)request:(DPRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"%@",error);
}
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result {
    NSDictionary *dict = result;
    dealModel *md = [[dealModel alloc]init];
    NSArray *modelArray = [md assignModelWithDict:dict];
    NSLog(@"%@",modelArray);
    NSLog(@"数组个数%lu --- %@",(unsigned long)modelArray.count,[modelArray[0]title]);
    
}


- (void)createNavBar {
    UIBarButtonItem *logo   = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    NavBarItem *first = [NavBarItem makeItem];
    [first addtarget:self action:@selector(firstItemClick)];
    NavBarItem *second = [NavBarItem makeItem];
    [second addtarget:self action:@selector(secondItemClick)];
    NavBarItem *third = [NavBarItem makeItem];
    [third addtarget:self action:@selector(thirdItemClick)];
    
    firstItem  = [[UIBarButtonItem alloc] initWithCustomView:first];
    secondItem = [[UIBarButtonItem alloc] initWithCustomView:second];
    thirdItem  = [[UIBarButtonItem alloc] initWithCustomView:third];
    self.navigationItem.leftBarButtonItems = @[logo,firstItem,secondItem,thirdItem];
}

#pragma mark -点击事件
- (void)firstItemClick {
    NSLog(@"1");
    [self createPopover];
    
}

- (void)secondItemClick {
    NSLog(@"2");
    [self createSecondPopover];
}

- (void)thirdItemClick {
    NSLog(@"3");
}

#pragma mark -创建第一个下拉菜单
- (void)createPopover {
    
    PopViewController *pvc = [[PopViewController alloc] init];
    UIPopoverController *pop = [[UIPopoverController alloc]initWithContentViewController:pvc];
    [pop presentPopoverFromBarButtonItem:firstItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}

#pragma mark -创建第二个下拉菜单
- (void)createSecondPopover {
    
    SecondPopViewController *pvc = [[SecondPopViewController alloc] initWithNibName:@"SecondPopViewController" bundle:nil];
    UIPopoverController *pop = [[UIPopoverController alloc]initWithContentViewController:pvc];
    [pop presentPopoverFromBarButtonItem:secondItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
