//
//  UIImage+HSExtension.h
//  FindTheSound
//
//  Created by pro on 15/12/21.
//  Copyright © 2015年 Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HSExtension)

/**
 *  图片显示原来的内容，不被渲染
 *
 *  @return <#return value description#>
 */
+ (instancetype)imageRenderingModeAlwaysOriginalNamed:(NSString *)name;

/**
 *  图片中间部分拉伸
 *
 *  @param name <#name description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)imageStretchableWithNamed:(NSString *)name;

/**
 *  图片样式
 *
 *  @param image <#image description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)imageStyle;


@end
