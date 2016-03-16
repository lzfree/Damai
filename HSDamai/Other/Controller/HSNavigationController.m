//
//  HSNavigationController.m
//  HSDamai
//
//  Created by Harris on 16/3/16.
//  Copyright © 2016年 HarrisHan. All rights reserved.
//

#import "HSNavigationController.h"

@interface HSNavigationController ()

@end

@implementation HSNavigationController

+ (void)initialize
{
    // 设置导航条文字样式
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    NSMutableDictionary *attributs = [NSMutableDictionary dictionary];
    
    attributs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    
    attributs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    [navBar setTitleTextAttributes:attributs];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navBar_64"] forBarMetrics:UIBarMetricsDefault];
    
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

@end
