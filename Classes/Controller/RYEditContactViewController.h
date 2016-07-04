//
//  RYEditContactViewController.h
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RYContact;
@class RYEditContactViewController;

@protocol RYEditContactViewControllerDelegate <NSObject>

- (void)editContactViewController:(RYEditContactViewController *)editContactViewController didClickSaveContact:(RYContact *)contact;

@end

@interface RYEditContactViewController : UIViewController

@property (nonatomic, strong) RYContact *contact;

@property (nonatomic, weak) id <RYEditContactViewControllerDelegate> delegate;

@end
