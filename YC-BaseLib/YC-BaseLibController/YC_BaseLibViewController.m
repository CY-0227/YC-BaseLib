//
//  YC-BaseLibViewController.m
//  YC_BaseLib
//
//  Created by YC_BaseLib on 2020/12/14.
//  Copyright © 2020 YC_BaseLib Inc All rights reserved.
//

#import "YC_BaseLibViewController.h"

@interface YC_BaseLibViewController ()

@end

@implementation YC_BaseLibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupYC_BaseLibUI];
}

- (void)setupYC_BaseLibUI {}

- (void)clickLeftBtnAction:(UIButton *)sender {}

- (void)clickRightBtnAction:(UIButton *)sender {}

- (void)setupYC_BasePostHttp {}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"dealloc----%@", NSStringFromClass([self class]));
}

@end
