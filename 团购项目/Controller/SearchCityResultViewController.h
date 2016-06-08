//
//  SeachBarController.h
//  团购项目
//
//  Created by Cheryl on 5/5/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCityResultViewController : UITableViewController
@property (nonatomic,copy)NSString *searchText;

@property (nonatomic,strong)NSArray *citiesArray;

@end
