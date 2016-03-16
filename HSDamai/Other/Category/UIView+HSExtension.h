//
//  UIView+HSExtension.h
//  FindTheSound
//
//  Created by pro on 15/12/21.
//  Copyright © 2015年 Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HSExtension)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

+ (instancetype)viewFromXib;
-(void)setlayoutWithEdgeInsets:(UIEdgeInsets)inset;

@end
