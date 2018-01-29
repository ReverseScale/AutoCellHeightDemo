//
//  UIImage+RadiusCorner.h
//  OCAutoCellHeight
//
//  Created by WhatsXie on 2018/1/29.
//  Copyright © 2018年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RadiusCorner)
/* On-screen-renderring绘制UIImage矩形圆角 */
- (UIImage *)imageWithCornerRadius:(CGFloat)radius ofSize:(CGSize)size;
@end

/*
 * 在屏渲染用法示例
 * on-screen-renderring
 image = [image imageWithCornerRadius:50 ofSize:imageView.frame.size];
 [imageView setImage:image];
*/
