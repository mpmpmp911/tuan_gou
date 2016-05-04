//
//  CatogriyModel.h
//  团购项目
//
//  Created by Cheryl on 5/3/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatogriyModel : NSObject

@property (nonatomic,copy) NSString * highlighted_icon;
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * small_highlighted_icon;
@property (nonatomic,copy) NSString * small_icon;

@property (nonatomic,strong) NSArray * subcategories;

- (NSArray *)loadPlistData;
@end
