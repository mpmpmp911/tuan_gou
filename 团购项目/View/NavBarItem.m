//
//  NavBarItem.m
//  团购项目
//
//  Created by ming_du1 on 4/27/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "NavBarItem.h"
@interface NavBarItem ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation NavBarItem

+ (instancetype)makeItem {
    return [[[NSBundle mainBundle]loadNibNamed:@"NavBarItem" owner:self options:nil]firstObject];
}

- (void)addtarget:(id) target action:(SEL)action {
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
