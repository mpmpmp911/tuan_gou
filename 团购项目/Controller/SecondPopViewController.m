//
//  SecondPopViewController.m
//  团购项目
//
//  Created by Cheryl on 5/5/16.
//  Copyright © 2016 rick. All rights reserved.
//

#import "SecondPopViewController.h"
#import "MyNavController.h"
#import "ChangeCityViewController.h"
#import "UIView+AutoLayout.h"

@interface SecondPopViewController ()

- (IBAction)changeCityClick:(id)sender;

@end

@implementation SecondPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeCityClick:(id)sender {
    ChangeCityViewController *changeCityVC = [[ChangeCityViewController alloc] initWithNibName:@"ChangeCityViewController" bundle:nil];
    MyNavController *nav = [[MyNavController alloc] initWithRootViewController:changeCityVC];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:nav animated:YES completion:nil];
    
}
@end
