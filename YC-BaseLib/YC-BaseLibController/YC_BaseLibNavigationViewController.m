//
//  YC-BaseLibNavigationViewController.m
//  YC_BaseLib
//
//  Created by YC_BaseLib on 2020/12/14.
//  Copyright © 2020 YC_BaseLib Inc All rights reserved.
//

#import "YC_BaseLibNavigationViewController.h"

@interface YC_BaseLibNavigationViewController ()

@end

@implementation YC_BaseLibNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = NO;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    CGRect rect = self.tabBarController.tabBar.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height;
    self.tabBarController.tabBar.frame = rect;
}

@end
