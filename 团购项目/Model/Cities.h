//
//  Cities.h
//  团购项目
//
//  Created by Cheryl on 5/17/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cities : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *pinYin;
@property (nonatomic,copy) NSString *pinYinHead;
@property (nonatomic,strong) NSArray *regions;

+(NSArray *)getCities;

@end
