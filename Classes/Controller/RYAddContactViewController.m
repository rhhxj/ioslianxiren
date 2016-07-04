//
//  RYAddContactViewController.m
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import "RYAddContactViewController.h"
#import "RYContact.h"

@interface RYAddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation RYAddContactViewController

#pragma mark - 添加联系人

/**
 *  添加联系人
 */
- (IBAction)addContact {
    // 1. 跳转回联系人列表界面
    [self.navigationController popViewControllerAnimated:YES];
    
    // 2. 获取联系人模型
    RYContact *contact = [RYContact contactWithName:self.nameField.text PhoneNum:self.phoneField.text];
    
    // 3. 通过代理实现数据回传
    if ([self.delegate respondsToSelector:@selector(addContactViewController:didClickAddContact:)]) {
        [self.delegate addContactViewController:self didClickAddContact:contact];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.nameField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.nameField becomeFirstResponder];
}

#pragma mark - 监听文本框改变

/**
 *  监听文本框改变
 */
- (void)textFieldDidChange {
    self.addBtn.hidden = !(self.nameField.text.length && self.phoneField.text.length);
}

@end
