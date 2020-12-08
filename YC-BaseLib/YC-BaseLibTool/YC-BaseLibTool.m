//
//  YC-BaseLibTool.m
//  Test5
//
//  Created by candy on 2020/12/7.
//  Copyright © 2020 com.candy.luck. All rights reserved.
//

#import "YC-BaseLibTool.h"
#import "UIViewController+Category.h"
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/AdSupport.h>
//#import <Masonry.h>
//#import <MBProgressHUD.h>

@implementation YC_BaseLibTool

+ (BOOL)isIphoneX {
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [UIApplication.sharedApplication.delegate window];
        return window.safeAreaInsets.top > 20;
    } else {
        return NO;
    }
}

+ (CGFloat)statusBarHeight {
    return [self isIphoneX] ? 40 : 20;
}

+ (CGFloat)navigationBarHeight {
    return [self isIphoneX] ? 88 : 64;
}

+ (CGFloat)bottomTabbarHeight {
    return 49 + [self bottomSafeHeight];
}

+ (CGFloat)topSafeHeight {
    return [self isIphoneX] ? 44 : 20;
}

+ (CGFloat)bottomSafeHeight {
    return [self isIphoneX] ? 34 : 0;
}

+ (CGFloat)screenScaleValue:(CGFloat)height {
    return [UIScreen mainScreen].bounds.size.width / 375.0 * height;
}

+ (CGSize)screenSizeScaleValue:(CGSize)size {
    return CGSizeMake([self screenScaleValue:size.width], [self screenScaleValue:size.height]);
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    return [self colorFromHexString:hexString alpha:1.0];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    if (hexString.length <= 0) {
        return nil;
    }
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    unsigned hexNum;
    if ( ![[NSScanner scannerWithString:hexString] scanHexInt:&hexNum] ) {
        return nil;
    }
    return [UIColor colorWithRed:((float)((hexNum & 0xFF0000) >> 16))/255.0 green:((float)((hexNum & 0xFF00) >> 8))/255.0 blue:((float)(hexNum & 0xFF))/255.0 alpha:alpha];
}

+ (UIColor *)colorFromRandom {
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
}

+ (UIColor *)colorGradientChangeWithSize:(CGSize)size direction:(YC_BaseLib_ColorGradientDirection)direction colors:(NSArray *)colors {
    return [UIColor colorWithPatternImage:[self imageGradientChangeWithSize:size direction:direction colors:colors]];
}

+ (UIImage *)imageGradientChangeWithSize:(CGSize)size direction:(YC_BaseLib_ColorGradientDirection)direction colors:(NSArray *)colors {
    if (CGSizeEqualToSize(size, CGSizeZero) || (colors.count < 2)) {
        return nil;
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    CGPoint startPoint = CGPointZero;
    if (direction == YC_BaseLib_ColorGradientDirectionDownDiagonalLine) {
        startPoint = CGPointMake(0, 1);
    }
    gradientLayer.startPoint = startPoint;
    CGPoint endPoint = CGPointZero;
    switch (direction) {
        case YC_BaseLib_ColorGradientDirectionLevel:
            endPoint = CGPointMake(1, 0);
            break;
        case YC_BaseLib_ColorGradientDirectionVertical:
            endPoint = CGPointMake(0, 1);
            break;
        case YC_BaseLib_ColorGradientDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1, 1);
            break;
        case YC_BaseLib_ColorGradientDirectionDownDiagonalLine:
            endPoint = CGPointMake(1, 0);
            break;
            
        default:
            break;
    }
    gradientLayer.endPoint = endPoint;
    NSMutableArray *cgcolors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgcolors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = cgcolors;
    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}

+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+ (NSString *)stringToLowerMD5:(NSString *)string {
    const char* aString = [string UTF8String];
    unsigned char result[16];
    CC_MD5(aString, (CC_LONG)strlen(aString), result);
    NSString* hash = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
    
    return [hash lowercaseString];
}

+ (void)createRoundedUIView:(UIView *)view frameRect:(CGRect)rect corners:(UIRectCorner)corners radius:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    if (corners != UIRectCornerAllCorners) {
        maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(corners, radius)];
    }
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

+ (void)creareBorderUIView:(UIView *)view borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    view.layer.borderColor = borderColor.CGColor;
    view.layer.borderWidth = borderWidth;
}

+ (void)createShadowUIView:(UIView *)view shadowColor:(UIColor *)shadowColor offset:(CGSize)offset shadowRadius:(CGFloat)shadowRadius opacity:(CGFloat)opacity {
    view.layer.shadowColor = shadowColor.CGColor;
    view.layer.shadowOffset = offset;
    view.layer.shadowRadius = shadowRadius;
    view.layer.opaque = opacity;
}

+ (void)createBorderShadowUIView:(UIView *)view borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth shadowColor:(UIColor *)shadowColor offset:(CGSize)offset shadowRadius:(CGFloat)shadowRadius opacity:(CGFloat)opacity {
    view.layer.borderColor = borderColor.CGColor;
    view.layer.borderWidth = borderWidth;
    view.layer.shadowColor = shadowColor.CGColor;
    view.layer.shadowOffset = offset;
    view.layer.shadowRadius = shadowRadius;
    view.layer.shadowOpacity = opacity;
}


+ (UIViewController *)topViewController {
    UIViewController *rootViewController = [self getKeyWindow].rootViewController;
    UIViewController *topViewController = [self getTopViewControllerFrom:rootViewController];
    return topViewController;
}

+ (UIViewController *)getTopViewControllerFrom:(UIViewController *)controller {
    UIViewController *topViewController;
    if ([controller presentedViewController]) {
        topViewController = [controller presentedViewController];
    }
    if ([controller isKindOfClass:[UITabBarController class]]) {
        topViewController = [self getTopViewControllerFrom:((UITabBarController *)controller).selectedViewController];
    } else if ([controller isKindOfClass:[UINavigationController class]]) {
        topViewController = [self getTopViewControllerFrom:((UINavigationController *)controller).topViewController];
    } else {
        topViewController = controller;
    }
    return topViewController;
}

+ (void)presentViewController:(NSString *)className completion:(void(^)(void))completion {
    [self presentViewController:className animated:YES completion:completion];
}

+ (void)presentViewController:(NSString *)className animated:(BOOL)animated completion:(void(^)(void))completion {
    [self presentViewController:className param:@{} animated:animated completion:completion];
}

+ (void)presentViewController:(NSString *)className param:(NSDictionary *)param animated:(BOOL)animated completion:(void(^)(void))completion {
    if (className.length <= 0) {
        return;
    }
    Class class = NSClassFromString(className);
    if (class) {
        id controller = [[class alloc] init];
        if (controller && param) {
            for (NSString *key in param.allKeys) {
                [controller setValue:param[key] forKey:key];
            }
        }
        UIViewController *topViewController = [self topViewController];
        if (topViewController) {
            [topViewController presentViewController:controller animated:animated completion:completion];
        }
    }
}

+ (void)pushViewController:(NSString *)className {
    [self pushViewController:className param:@{}];
}

+ (void)pushViewController:(NSString *)className param:(NSDictionary *)param {
    [self pushViewController:className param:param animated:YES];
}

+ (void)pushViewController:(NSString *)className param:(NSDictionary *)param animated:(BOOL)animated {
    if (className.length <= 0) {
        return;
    }
    Class class = NSClassFromString(className);
    if (class) {
        id controller = [[class alloc] init];
        if (controller && param) {
            for (NSString *key in param.allKeys) {
                [controller setValue:param[key] forKey:key];
            }
        }
        UIViewController *topViewController = [self topViewController];
        if (!topViewController) {
            return;
        }
        if (topViewController.presentingViewController) {
            topViewController = topViewController.presentingViewController;
        }
        UINavigationController *navigationController = topViewController.navigationController;
        if ([topViewController isKindOfClass:[UINavigationController class]]) {
            navigationController = (UINavigationController *)topViewController;
        }
        [navigationController pushViewController:controller animated:animated];
        if (((UIViewController *)controller).isOnceNeedly) {
            NSArray *controllers = [navigationController.viewControllers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
                return [evaluatedObject isKindOfClass:[controller class]];
            }]];
            if (controllers.count < 2) {
                return;
            }
            // 删除之前的，否则pop时会看见两个相同controller
            NSArray *others = [navigationController.viewControllers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
                return ![evaluatedObject isKindOfClass:[controller class]];
            }]];
            NSMutableArray *aNewControllers = [NSMutableArray arrayWithArray:others];
            [aNewControllers addObject:controller];
            [navigationController setViewControllers:aNewControllers animated:NO];
        }
    }
}


+ (UIWindow *)getKeyWindow {
    return [UIApplication sharedApplication].delegate.window;
}

+ (void)toast:(NSString *)message {
    UIView *contentView = [[UIView alloc] init];
    contentView.layer.cornerRadius = 5;
    contentView.backgroundColor = [self colorFromHexString:@"3A3A3A"];
    [[self getKeyWindow] addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@0);
        make.width.lessThanOrEqualTo(contentView.superview).multipliedBy(0.8);
    }];
    UILabel *label = [[UILabel alloc] init];
    label.text = message;
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:15];
    [contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(12, 25, 12, 25));
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [contentView removeFromSuperview];
    });
}

+ (void)showLoading:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[self getKeyWindow] animated:YES];
    if (message.length <= 0) {
        hud.label.text = @"Loading...";
    } else {
        hud.label.text = message;
    }
}

+ (void)removeLoading {
    [MBProgressHUD hideHUDForView:[self getKeyWindow] animated:YES];
}


+ (NSString *)getAppVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}

+ (NSString *)getAppBundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)getMobileSystemVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)getIDFA {
    static NSString *advertisingIdentifier = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        advertisingIdentifier = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        if (advertisingIdentifier.length == 0 ||
            [advertisingIdentifier isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
            advertisingIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        }
    });
    return advertisingIdentifier;
}


+ (NSString *)getCurrentTimestamp {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    long long totalMilliseconds = interval * 1000;
    return [NSString stringWithFormat:@"%llu", totalMilliseconds];
}

+ (NSString *)getStringFromDate:(NSDate *)date formatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)getDateFromString:(NSString *)string formatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter dateFromString:string];
}


+ (void)addUserDefaultValue:(id)value forKey:(NSString *)key {
    if (value == nil || key.length <= 0) {
        return;
    }
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:value forKey:key];
    [user synchronize];
}

+ (id)getUserDefaultValueForKey:(NSString *)key {
    if (key.length <= 0) {
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

@end
