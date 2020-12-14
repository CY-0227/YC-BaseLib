//
//  YC-BaseLibTableViewCell.m
//  YC_BaseLib
//
//  Created by YC_BaseLib on 2020/12/14.
//  Copyright © 2020 YC_BaseLib Inc All rights reserved.
//

#import "YC_BaseLibTableViewCell.h"

@implementation YC_BaseLibTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupYC_BaseLibUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupYC_BaseLibUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupYC_BaseLibUI {
    
}

@end
