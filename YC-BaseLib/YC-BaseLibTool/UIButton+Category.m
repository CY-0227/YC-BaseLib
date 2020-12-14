//
//  UIButton+Category.m
//  YC_BaseLib
//
//  Created by candy on 2020/12/7.
//  Copyright © 2020 YC_BaseLib Inc All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

- (void)YC_BaseLib_layoutButtonWithImageStyle:(YC_BaseLib_ButtonImageStyle)style imageTitleToSpace:(CGFloat)space
{
    //1、获取imageView和titleLabel的高和宽
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    CGFloat titleWidth = self.titleLabel.frame.size.width;
    CGFloat titleHeight = self.titleLabel.frame.size.height;

    //2、初始化一个内偏移
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;

    //3、不同的样式处理不同的内偏移
    switch (style) {
        case YC_BaseLib_ButtonImageStyleTop:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, titleHeight + space / 2, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(imageHeight + space / 2, -imageWidth, 0, 0);
            break;
        case YC_BaseLib_ButtonImageStyleLeft:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, space / 2);
            titleEdgeInsets = UIEdgeInsetsMake(0, space / 2, 0, 0);
            break;
        case YC_BaseLib_ButtonImageStyleBottom:
            imageEdgeInsets = UIEdgeInsetsMake(titleHeight + space / 2, 0, 0, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, imageHeight + space / 2, 0);
            break;
        case YC_BaseLib_ButtonImageStyleRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + space / 2, 0, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - space / 2, 0, imageWidth);
            break;
        default:
            break;
    }
    //4、赋值
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
}

@end
