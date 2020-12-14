//
//  YC-BaseLibViewController.h
//  YC_BaseLib
//
//  Created by YC_BaseLib on 2020/12/14.
//  Copyright © 2020 YC_BaseLib Inc All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YC_BaseLibViewController : UIViewController

@property (strong, nonatomic) UIView *baseLibNavigationView;

@property (strong, nonatomic) UILabel *baseLibTitleLab;

@property (strong, nonatomic) UIButton *baseLibLeftBtn;

@property (strong, nonatomic) UIButton *baseLibRightBtn;

@property (strong, nonatomic) UIView *baseLibLineView;

- (void)setupYC_BaseLibUI;

- (void)clickLeftBtnAction:(UIButton *)sender;

- (void)clickRightBtnAction:(UIButton *)sender;

- (void)setupYC_BasePostHttp;

@end

NS_ASSUME_NONNULL_END
