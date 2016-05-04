//
//  CatogriyModel.m
//  团购项目
//
//  Created by Cheryl on 5/3/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "CatogriyModel.h"

@implementation CatogriyModel

//加载plist文件
- (NSArray *)loadPlistData {
    //获取plist文件地址
    NSString *file = [[NSBundle mainBundle] pathForResource:@"categories.plist" ofType:nil];
    //加载plist file 为数组
    NSArray *plistArr = [NSArray arrayWithContentsOfFile:file];
    NSArray *dataArr = [self getDataArrWith:plistArr];
    return dataArr;
}

//解析plist file
- (NSArray *)getDataArrWith:(NSArray *)Arr {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in Arr) {
        CatogriyModel *md = [[CatogriyModel alloc] init];
        [md makeModelWithDict:dict];
        [array addObject: md];
    }
    return array;
}

//字典转化模型
- (CatogriyModel *)makeModelWithDict:(NSDictionary *)dict {
    self.highlighted_icon = [dict objectForKey:@"highlighted_icon"];
    self.icon = [dict objectForKey:@"icon"];
    self.name = [dict objectForKey:@"name"];
    self.small_highlighted_icon = [dict objectForKey:@"small_highlighted_icon"];
    self.small_icon = [dict objectForKey:@"small_icon"];
    self.subcategories = [dict objectForKey:@"subcategories"];
    return self;
}

@end
