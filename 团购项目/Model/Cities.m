//
//  Cities.m
//  团购项目
//
//  Created by Cheryl on 5/17/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "Cities.h"

@implementation Cities
+(NSArray *)getCities {
    //1.获取plist文件的地址
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil];
    //2.加载plist文件为数组
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    //3.遍历数组，字典转模型
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in plistArray) {
        Cities *cityModel = [[Cities alloc]init];
        cityModel.name= [dict objectForKey:@"name"];
        cityModel.pinYin= [dict objectForKey:@"pinYin"];
        cityModel.pinYinHead= [dict objectForKey:@"pinYinHead"];
        cityModel.regions = [dict objectForKey:@"regions"];
        [modelArray addObject:cityModel];
    }
    return modelArray;
}

@end
