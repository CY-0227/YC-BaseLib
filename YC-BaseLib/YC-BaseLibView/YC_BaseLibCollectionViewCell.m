//
//  YC-BaseLibCollectionViewCell.m
//  YC_BaseLib
//
//  Created by YC_BaseLib on 2020/12/14.
//  Copyright © 2020 YC_BaseLib Inc All rights reserved.
//

#import "YC_BaseLibCollectionViewCell.h"

@implementation YC_BaseLibCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupYC_BaseLibUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupYC_BaseLibUI];
}

- (void)setupYC_BaseLibUI {
    
}

@end
