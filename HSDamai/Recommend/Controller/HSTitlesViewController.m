//
//  HSTitlesViewController.m
//  HSDamai
//
//  Created by Harris on 16/3/16.
//  Copyright © 2016年 HarrisHan. All rights reserved.
//

#import "HSTitlesViewController.h"
#import "HSRecommendViewController.h"

@interface HSTitlesViewController ()<UIScrollViewDelegate>

/** 标签底部的红色指示器 */
@property (nonatomic, weak) UIView *indicatorView;

/** 当前选中的按钮 */
@property (nonatomic, weak) UIButton *selectedButton;

/** 顶部所有的标签 */
@property (nonatomic, weak) UIScrollView *titlesView;

/** 底部的内容层 */
@property (nonatomic, weak) UIScrollView *contentView;

@end

@implementation HSTitlesViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupChildVces];
    
    [self setupTitlesView];
    
    [self setupContentView];
    
}

- (void)setupNav
{

    self.view.backgroundColor = HSBackgroundColor;
    
}

- (void)setupChildVces
{

    HSRecommendViewController *recommendLocal = [[HSRecommendViewController alloc] init];
    recommendLocal.type = HSRecommendLocal;
    recommendLocal.title = @"本地推荐";
    [self addChildViewController:recommendLocal];
    
    
    HSRecommendViewController *recommendHot = [[HSRecommendViewController alloc] init];
    recommendHot.type = HSRecommendHot;
    recommendHot.title = @"全国热点";
    [self addChildViewController:recommendHot];
    
    
}

/**
 *  设置顶部的标签栏
 */
- (void)setupTitlesView
{

    // 顶部标签栏
    UIScrollView *titleScrollView = [[UIScrollView alloc] init];
    
    titleScrollView.backgroundColor = [UIColor whiteColor];
    
    titleScrollView.width = self.view.width;
    
    titleScrollView.contentSize = CGSizeMake(self.view.width, HSTitlesViewH);
    
    titleScrollView.height = HSTitlesViewH;
    
    titleScrollView.y = HSIndicatorViewY;
    
    [self.view addSubview:titleScrollView];
    
    self.titlesView = titleScrollView;
    
    // 底部红色View
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = HSIndicatorViewH;
    indicatorView.tag = -1;
    indicatorView.y = titleScrollView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    // 内部标签
    CGFloat width = titleScrollView.contentSize.width / self.childViewControllers.count;
    CGFloat height = titleScrollView.height;
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        UIViewController *vc = self.childViewControllers[i];
        [button setTitle:vc.title forState:UIControlStateNormal];
        [button setTitleColor:HSMainRedColor forState:UIControlStateDisabled];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleScrollView addSubview:button];
        
        // 默认选中第一个
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            
            // 让按钮内部的Lable根据文字内容计算尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
    
    [titleScrollView addSubview:indicatorView];
}

- (void)setupContentView
{

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    
    contentView.frame = self.view.bounds;
    
    contentView.delegate = self;
    
    contentView.pagingEnabled = YES;
    
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    
    self.contentView = contentView;
    
    // 添加第一个控制器的View
    [self scrollViewDidEndScrollingAnimation:contentView];
}

- (void)titleClick:(UIButton *)button
{
     // 修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];
    
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
    
}

#pragma mark - <UISCrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    vc.view.x = scrollView.contentOffset.x;
    
    vc.view.y = 0;
    
    vc.view.height = scrollView.height;
    
    [scrollView addSubview:vc.view];

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    [self scrollViewDidEndDecelerating:scrollView];
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    [self titleClick:self.titlesView.subviews[index]];
    
}


@end
