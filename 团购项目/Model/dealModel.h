//
//  dealModel.h
//  团购项目
//
//  Created by Cheryl on 6/23/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dealModel : NSObject
/*
businesses =             (
);
categories =             (
                          "\U5ddd\U83dc",
                          "\U5ddd\U6e58\U83dc",
                          "\U5c0f\U5403\U5feb\U9910",
                          "\U805a\U9910\U5bb4\U8bf7",
                          "\U70e7\U70e4/\U70e4\U8089"
                          );
city = "\U963f\U575d";
"commission_ratio" = 0;
"current_price" = 90;
"deal_h5_url" = "http://m.dianping.com/tuan/deal/11015851?utm_source=open";
"deal_id" = "255-11015851";
"deal_url" = "http://t.dianping.com/deal/11015851?utm_source=open";
description = "\U91cd\U5e86\U4eba\U5bb6 \U4ec5\U552e90\U5143\Uff01\U4ef7\U503c100\U5143\U7684\U4ee3\U91d1\U52381\U5f20\Uff0c\U4ec5\U9002\U7528\U4e8e\U83dc\U54c1\Uff0c\U53ef\U514d\U8d39\U4f7f\U7528\U5305\U95f4\Uff0c\U63d0\U4f9b\U514d\U8d39wifi\U3002";
distance = "-1";
"image_url" = "http://p1.meituan.net/deal/1f30c396fd721a3696eff1c12a61ac3573095.jpg%40640w_400h_1e_1c_1l%7Cwatermark%3D1%26%26object%3DL2RwZGVhbC9hMWQ4Yzc5ZjUxZGVlNWZjOGM5MzkwYTBjZDNjODIyZDgxOTIucG5nQDIwUA%3D%3D%26p%3D9%26x%3D20%26y%3D2";
"list_price" = 100;
"publish_date" = "2016-03-31";
"purchase_count" = 646;
"purchase_deadline" = "2016-07-04";
regions =             (
);
"s_image_url" = "http://p1.meituan.net/deal/1f30c396fd721a3696eff1c12a61ac3573095.jpg%40160w_100h_1e_1c_1l%7Cwatermark%3D1%26%26object%3DL2RwZGVhbC9hMWQ4Yzc5ZjUxZGVlNWZjOGM5MzkwYTBjZDNjODIyZDgxOTIucG5nQDIwUA%3D%3D%26p%3D9%26x%3D20%26y%3D2";
title = "\U91cd\U5e86\U4eba\U5bb6";
*/
@property (nonatomic,copy) NSString *categories;
@property (nonatomic,copy) NSString *city;
@property (nonatomic,copy) NSString *regions;
@property (nonatomic,copy) NSString *current_price;
@property (nonatomic,copy) NSString *deal_h5_url;
@property (nonatomic,copy) NSString *deal_url;
@property (nonatomic,copy) NSString *Description;
@property (nonatomic,copy) NSString *image_url;
@property (nonatomic,copy) NSString *list_price;
@property (nonatomic,copy) NSString *publish_date;
@property (nonatomic,copy) NSString *purchase_count;
@property (nonatomic,copy) NSString *purchase_deadline;
@property (nonatomic,copy) NSString *s_image_url;
@property (nonatomic,copy) NSString *title;

- (NSArray *)assignModelWithDict:(NSDictionary *)dict;

@end
