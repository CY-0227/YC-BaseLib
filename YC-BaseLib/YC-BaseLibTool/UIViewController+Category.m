//
//  UIViewController+Category.m
//  Test5
//
//  Created by candy on 2020/12/7.
//  Copyright © 2020 com.candy.luck. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>

static NSString *isOnceNeedlyKey = @"isOnceNeedlyKey";

@implementation UIViewController (Category)

- (void)setIsOnceNeedly:(BOOL)isOnceNeedly {
    objc_setAssociatedObject(self, &isOnceNeedlyKey, @(isOnceNeedly), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isOnceNeedly {
    return objc_getAssociatedObject(self, &isOnceNeedlyKey);
}

@end
