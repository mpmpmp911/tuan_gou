//
//  cityGourpsModel.m
//  团购项目
//
//  Created by Cheryl on 5/5/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "cityGourpsModel.h"

@implementation cityGourpsModel{
    NSArray *_plistArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadPlist];
    }
    return self;
}

- (void)loadPlist {
    NSString *file = [[NSBundle mainBundle] pathForResource:@"cityGroups.plist" ofType:nil];
    //加载plist file 为数组
    _plistArray = [NSArray arrayWithContentsOfFile:file];
}

//解析数据模型,并返回数组
- (NSArray *)getModelArray {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in _plistArray) {
        cityGourpsModel *md = [[cityGourpsModel alloc] init];
        md.title  = [dict objectForKey:@"title"];
        md.cities = [dict objectForKey:@"cities"];
        [arr addObject:md];
    }
    return arr;
}

@end
