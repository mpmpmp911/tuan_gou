//
//  popView.h
//  团购项目
//
//  Created by ming_du1 on 4/28/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class popView;

@protocol MypopViewDataSource <NSObject>

//左表 行数
- (NSInteger)numberOfRowsinLeftTableView:(popView *)popView;
//左表 标题
- (NSString *)popView:(popView *)popView titleForRow:(NSInteger)row;
//左表 图标
- (NSString *)popView:(popView *)popView imageForRow:(NSInteger)row;
//左表 子数据
- (NSArray *)popView:(popView *)popView subDataForRow:(NSInteger)row;

@end

@protocol MypopViewDelegate <NSObject>

//选择左侧表时调用
- (void)leftpopView:(popView *)popView didSelectRowAtIndexPath:(NSInteger)row;
//选择右侧表时调用
- (void)rightpopView:(popView *)popView didSelectRowAtIndexPath:(NSInteger)row;

@end

@interface popView : UIView

@property (strong,nonatomic) NSArray *categriyArr;
@property (nonatomic,assign)id<MypopViewDataSource> dataSource;
@property (nonatomic,assign)id<MypopViewDelegate> delegate;

+ (popView*)makePopView;


@end
