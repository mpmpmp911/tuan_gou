//
//  dealModel.m
//  团购项目
//
//  Created by Cheryl on 6/23/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "dealModel.h"

@implementation dealModel

- (NSArray *)assignModelWithDict:(NSDictionary *)dict {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSArray *dictArray = [dict objectForKey:@"deals"];
    for (NSDictionary *dict in dictArray) {
        dealModel *md = [[dealModel alloc]init];
        md.categories = dict[@"categories"];
        md.city = dict[@"city"];
        md.current_price = dict[@"current_price"];
        md.deal_url = dict[@"deal_url"];
        md.Description = dict[@"description"];
        md.image_url = dict[@"image_url"];
        md.s_image_url = dict[@"s_image_url"];
        md.list_price = dict[@"list_price"];
        md.purchase_deadline = dict[@"purchase_deadline"];
        md.title = dict[@"title"];
        [arr addObject:md];
    }
    return arr;
}

@end
