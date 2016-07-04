//
//  RYAddContactViewController.h
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RYContact;
@class RYAddContactViewController;

@protocol RYAddContactViewControllerDelegate <NSObject>

@optional
- (void)addContactViewController:(RYAddContactViewController *)addContactViewController didClickAddContact:(RYContact *)contact;

@end

@interface RYAddContactViewController : UIViewController

@property (nonatomic, weak) id <RYAddContactViewControllerDelegate> delegate;

@end
