//
//  NavBarItem.h
//  团购项目
//
//  Created by ming_du1 on 4/27/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavBarItem : UIView

+ (instancetype)makeItem;

//为item添加点击事件
- (void)addtarget:(id) target action:(SEL)action;

@end
