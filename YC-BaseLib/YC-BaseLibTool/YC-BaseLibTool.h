//
//  YC-BaseLibTool.h
//  Test5
//
//  Created by candy on 2020/12/7.
//  Copyright © 2020 com.candy.luck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum YC_BaseLib_ColorGradientDirection {
    YC_BaseLib_ColorGradientDirectionLevel = 0,
    YC_BaseLib_ColorGradientDirectionVertical,
    YC_BaseLib_ColorGradientDirectionUpwardDiagonalLine,
    YC_BaseLib_ColorGradientDirectionDownDiagonalLine
} YC_BaseLib_ColorGradientDirection;

@interface YC_BaseLibTool : NSObject

+ (BOOL)isIphoneX;

+ (CGFloat)statusBarHeight;

+ (CGFloat)navigationBarHeight;

+ (CGFloat)bottomTabbarHeight;

+ (CGFloat)topSafeHeight;

+ (CGFloat)bottomSafeHeight;

+ (CGFloat)screenScaleValue:(CGFloat)height;

+ (CGSize)screenSizeScaleValue:(CGSize)size;


+ (UIColor *)colorFromHexString:(NSString *)hexString;

+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)colorFromRandom;

+ (UIColor *)colorGradientChangeWithSize:(CGSize)size direction:(YC_BaseLib_ColorGradientDirection)direction colors:(NSArray *)colors;

+ (UIImage *)imageGradientChangeWithSize:(CGSize)size direction:(YC_BaseLib_ColorGradientDirection)direction colors:(NSArray *)colors;

+ (UIImage *)imageFromColor:(UIColor *)color;


+ (NSString *)stringToLowerMD5:(NSString *)string;

+ (void)createRoundedUIView:(UIView *)view frameRect:(CGRect)rect corners:(UIRectCorner)corners radius:(CGFloat)radius;

+ (void)creareBorderUIView:(UIView *)view borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

+ (void)createShadowUIView:(UIView *)view shadowColor:(UIColor *)shadowColor offset:(CGSize)offset shadowRadius:(CGFloat)shadowRadius opacity:(CGFloat)opacity;

+ (void)createBorderShadowUIView:(UIView *)view borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth shadowColor:(UIColor *)shadowColor offset:(CGSize)offset shadowRadius:(CGFloat)shadowRadius opacity:(CGFloat)opacity;


+ (UIViewController *)topViewController;

+ (void)presentViewController:(NSString *)className completion:(void(^)(void))completion;

+ (void)presentViewController:(NSString *)className animated:(BOOL)animated completion:(void(^)(void))completion;

+ (void)presentViewController:(NSString *)className param:(NSDictionary *)param animated:(BOOL)animated completion:(void(^)(void))completion;

+ (void)pushViewController:(NSString *)className;

+ (void)pushViewController:(NSString *)className param:(NSDictionary *)param;

+ (void)pushViewController:(NSString *)className param:(NSDictionary *)param animated:(BOOL)animated;


+ (UIWindow *)getKeyWindow;

+ (void)toast:(NSString *)message;

+ (void)showLoading:(NSString *)message;

+ (void)removeLoading;


+ (NSString *)getAppVersion;

+ (NSString *)getAppBundleIdentifier;

+ (NSString *)getMobileSystemVersion;

+ (NSString *)getIDFA;


+ (NSString *)getCurrentTimestamp;

+ (NSString *)getStringFromDate:(NSDate *)date formatter:(NSString *)formatter;

+ (NSDate *)getDateFromString:(NSString *)string formatter:(NSString *)formatter;


+ (void)addUserDefaultValue:(id)value forKey:(NSString *)key;

+ (id)getUserDefaultValueForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
