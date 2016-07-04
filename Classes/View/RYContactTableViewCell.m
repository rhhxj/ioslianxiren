//
//  RYContactTableViewCell.m
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import "RYContactTableViewCell.h"

@interface RYContactTableViewCell ()

@property (nonatomic, weak) UIView *devideLine;

@end

@implementation RYContactTableViewCell

- (UIView *)devideLine {
    
    if (_devideLine == nil) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.2;
        
        [self.contentView addSubview:view];
        _devideLine = view;
    }
    
    return _devideLine;
}

- (void)setContact:(RYContact *)contact {
    _contact = contact;
    
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phoneNum;
}

+ (instancetype)contactTableViewCellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"ContactCell";
    return [tableView dequeueReusableCellWithIdentifier:cellID];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat devideX = 0;
    CGFloat devideW = self.bounds.size.width;
    CGFloat devideH = 1;
    CGFloat devideY = self.bounds.size.height - devideH;
    
    self.devideLine.frame = CGRectMake(devideX, devideY, devideW, devideH);
}

- (void)awakeFromNib {
    // Initialization code
}

@end
