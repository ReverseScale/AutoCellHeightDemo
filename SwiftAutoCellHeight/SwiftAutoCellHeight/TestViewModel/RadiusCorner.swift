//
//  RadiusCorner.swift
//  SwiftAutoCellHeight
//
//  Created by WhatsXie on 2018/1/29.
//  Copyright © 2018年 StevenXie. All rights reserved.
//

import UIKit

/*
 * 在屏渲染用法示例
 * on-screen-renderring
 let renderedImage = imagePhone.image?.imageWithCornerRadius(radius: 50, of: CGSize(width: 100, height: 100))
 imagePhone.image = renderedImage
 */

extension UIImage {
    /**
     * On-screen-renderring绘制UIImage矩形圆角
     */
    public func imageWithCornerRadius(radius: CGFloat, of size: CGSize) -> UIImage {
        /* 当前UIImage的可见绘制区域 */
//        0.0, 0.0, size.width,size.height
        let rect = CGRect(origin: CGPoint.zero, size: size)
        /* 创建基于位图的上下文 */
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        /* 在当前位图上下文添加圆角绘制路径 */
        UIGraphicsGetCurrentContext()?.addPath(UIBezierPath(roundedRect: rect , cornerRadius: radius).cgPath)
        /* 当前绘制路径和原绘制路径相交得到最终裁剪绘制路径 */
        UIGraphicsGetCurrentContext()?.clip()
        /* 绘制 */
        draw(in: rect )
        /* 取得裁剪后的image */
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        /* 关闭当前位图上下文 */
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
