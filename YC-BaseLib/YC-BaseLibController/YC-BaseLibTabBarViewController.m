//
//  YC-BaseLibTabBarViewController.m
//  YC_BaseLib
//
//  Created by YC_BaseLib on 2020/12/14.
//  Copyright © 2020 YC_BaseLib Inc All rights reserved.
//

#import "YC-BaseLibTabBarViewController.h"

@interface YC_BaseLibTabBarViewController ()

@end

@implementation YC_BaseLibTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 11.0, *)) {
        
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = [UIColor whiteColor];
}

- (void)addChildViewController:(NSArray<UIViewController *> *)controllers titles:(NSArray *)titles images:(NSArray *)images selectedImages:(NSArray *)selectedImages {
    [controllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.title = titles[idx];
        obj.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[idx] image:[UIImage imageNamed:images[idx]] selectedImage:[UIImage imageNamed:selectedImages[idx]]];
        [self addChildViewController:obj];
    }];
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

@end
