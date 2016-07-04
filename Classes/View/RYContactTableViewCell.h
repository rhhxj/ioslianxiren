//
//  RYContactTableViewCell.h
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYContact.h"

@interface RYContactTableViewCell : UITableViewCell

@property (nonatomic, strong) RYContact *contact;

+ (instancetype)contactTableViewCellWithTableView:(UITableView *)tableView;

@end
