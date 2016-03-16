//
//  UIImage+HSExtension.m
//  FindTheSound
//
//  Created by pro on 15/12/21.
//  Copyright © 2015年 Harris. All rights reserved.
//

#import "UIImage+HSExtension.h"

@implementation UIImage (HSExtension)

+(instancetype)imageRenderingModeAlwaysOriginalNamed:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

+ (instancetype)imageStretchableWithNamed:(NSString *)name
{
    // 设置背景颜色
    UIImage *image = [UIImage imageNamed:name];
    // 设置图片拉伸部分
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    return image;
}

- (instancetype)imageStyle
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctr, rect);
    // 裁剪
    CGContextClip(ctr);
    
    [self drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
