//
//  cityGourpsModel.h
//  团购项目
//
//  Created by Cheryl on 5/5/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cityGourpsModel : NSObject

@property (nonatomic,strong) NSArray *  cities;
@property (nonatomic,copy)   NSString * title;
- (NSArray *)getModelArray;
@end
