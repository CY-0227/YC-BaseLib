//
//  UIButton+Category.h
//  Test5
//
//  Created by candy on 2020/12/7.
//  Copyright © 2020 com.candy.luck. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YC_BaseLib_ButtonImageStyle) {
    YC_BaseLib_ButtonImageStyleTop = 0,  //图片在上，文字在下
    YC_BaseLib_ButtonImageStyleLeft,     //图片在左，文字在右
    YC_BaseLib_ButtonImageStyleBottom,   //图片在下，文字在上
    YC_BaseLib_ButtonImageStyleRight     //图片在右，文字在左
};

@interface UIButton (Category)

- (void)YC_BaseLib_layoutButtonWithImageStyle:(YC_BaseLib_ButtonImageStyle)style
                   imageTitleToSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
