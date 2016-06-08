//
//  popView.m
//  团购项目
//
//  Created by ming_du1 on 4/28/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "popView.h"


@interface popView ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *leftTV;
@property (weak, nonatomic) IBOutlet UITableView *rightTV;


@property (assign,nonatomic)  NSInteger selectRow;

@end

@implementation popView


+ (popView*)makePopView {
    return [[[NSBundle mainBundle]loadNibNamed:@"popView" owner:self options:nil]firstObject];
}

#pragma mark  -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == _leftTV){
        return [self.dataSource numberOfRowsinLeftTableView:self];
    }else {
        return [self.dataSource popView:self subDataForRow:_selectRow].count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    if(tableView == _leftTV){
       
        cell.textLabel.text  = [self.dataSource popView:self titleForRow:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[self.dataSource popView:self imageForRow:indexPath.row]];
        NSArray * subArray = [self.dataSource popView:self subDataForRow:indexPath.row];
        if (subArray.count) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }else {
        cell.textLabel.text = [self.dataSource popView:self subDataForRow:_selectRow][indexPath.row];
    }
    return cell;
}

#pragma mark  -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTV) {
        self.selectRow = indexPath.row;
        [_rightTV reloadData];
        if ([self.delegate respondsToSelector:@selector(leftpopView: didSelectRowAtIndexPath:)]) {
            //进一步实现
            [self.delegate leftpopView:self didSelectRowAtIndexPath:indexPath.row];
        }
    } else {
        if ([self.delegate respondsToSelector:@selector(rightpopView:didSelectRowAtIndexPath:)]) {
            //进一步实现
            [self.delegate rightpopView:self didSelectRowAtIndexPath:indexPath.row];
        }
    }
}

@end
