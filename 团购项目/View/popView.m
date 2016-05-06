//
//  popView.m
//  团购项目
//
//  Created by ming_du1 on 4/28/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "popView.h"
#import "CatogriyModel.h"

@interface popView ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *leftTV;
@property (weak, nonatomic) IBOutlet UITableView *rightTV;
@property (strong,nonatomic) CatogriyModel * selectedMode;

@end

@implementation popView


+ (popView*)makePopView {
    return [[[NSBundle mainBundle]loadNibNamed:@"popView" owner:self options:nil]firstObject];
}

#pragma mark  -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == _leftTV){
        return _categriyArr.count;
    }else {
        return _selectedMode.subcategories.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    if(tableView == _leftTV){
        CatogriyModel *md = [_categriyArr objectAtIndex:indexPath.row];
        cell.textLabel.text  = md.name;
        cell.imageView.image = [UIImage imageNamed:md.small_icon];
        if (md.subcategories.count) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }else {
       cell.textLabel.text = _selectedMode.subcategories[indexPath.row];
    }
    return cell;
}

#pragma mark  -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTV) {
        _selectedMode = [_categriyArr objectAtIndex:indexPath.row];
        [_rightTV reloadData];
    }
}

@end
