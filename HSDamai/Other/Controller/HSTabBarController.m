//
//  HSTabBarController.m
//  HSDamai
//
//  Created by Harris on 16/3/16.
//  Copyright © 2016年 HarrisHan. All rights reserved.
//

#import "HSTabBarController.h"
#import "HSNavigationController.h"
#import "HSRecommendViewController.h"
#import "HSShowViewController.h"
#import "HSFilmViewController.h"
#import "HSFunViewController.h"
#import "HSMineViewController.h"


@interface HSTabBarController ()

@end

@implementation HSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tabBar文字属性
    NSMutableDictionary *attributs = [NSMutableDictionary dictionary];
    attributs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attributs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    NSMutableDictionary *selectAttributs = [NSMutableDictionary dictionary];
    selectAttributs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    selectAttributs[NSForegroundColorAttributeName] = HSColor(221, 0, 50);
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attributs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttributs forState:UIControlStateSelected];

    // 设置TabBar背景图片
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bg_tabbar"];
    
    // 添加子控制器
    [self addChildViewController];
    
}

/**
 *  添加子控制器
 */
- (void)addChildViewController
{

    [self setupChildVc:[[HSRecommendViewController alloc] init]
                 title:@"推荐"
                 image:@"icon_tab1_normal"
          selectedImge:@"icon_tab1_selected"];
    
    [self setupChildVc:[[HSShowViewController alloc] init]
                 title:@"演出"
                 image:@"icon_tab2_normal"
          selectedImge:@"icon_tab2_selected"];

    [self setupChildVc:[[HSFunViewController alloc] init]
                 title:@"玩乐"
                 image:@"icon_tab5_normal"
          selectedImge:@"icon_tab5_selected"];
    
    [self setupChildVc:[[HSFilmViewController alloc] init]
                 title:@"电影"
                 image:@"icon_tab3_normal"
          selectedImge:@"icon_tab3_selected"];
    
    [self setupChildVc:[[HSMineViewController alloc] init]
                 title:@"我的"
                 image:@"icon_tab4_normal"
          selectedImge:@"icon_tab4_selected"];
    
    
}


/**
 *  初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImge:(NSString *)selectedImage
{

    // 设置tabBarItem 文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageRenderingModeAlwaysOriginalNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageRenderingModeAlwaysOriginalNamed:selectedImage];

    // 包装一个导航控制器，添加导航控制器为tabbar控制器的子控制器
    HSNavigationController *naVc = [[HSNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:naVc];
    
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
