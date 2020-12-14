//
//  YC-BaseLibView.m
//  YC-BaseLib
//
//  Created by YC-BaseLib on 2020/12/14.
//  Copyright © 2020 YC-BaseLib Inc All rights reserved.
//

#import "YC-BaseLibView.h"

@implementation YC_BaseLibView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupYC_BaseLibUI];
    }
    return self;
}

- (void)setupYC_BaseLibUI {}

@end
