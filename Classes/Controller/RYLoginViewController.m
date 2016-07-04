//
//  RYLoginViewController.m
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import "RYLoginViewController.h"
#import "MBProgressHUD+MJ.h"

@interface RYLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pswField;
@property (weak, nonatomic) IBOutlet UISwitch *rmbSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation RYLoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.accountField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.pswField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textFieldDidChange];
}

/**
 *  点击登陆
 */
- (IBAction)login {
    
    // 判断账号和密码是否正确
    if ([self.accountField.text isEqualToString:@"MBC"] && [self.pswField.text isEqualToString:@"123"]) {
        
        // 显示遮盖
        [MBProgressHUD showMessage:@"正在登陆中"];
        
        // GCD
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 除去遮盖
            [MBProgressHUD hideHUD];
            
            [self performSegueWithIdentifier:@"login2contacts" sender:nil];
        });
    } else {
        [MBProgressHUD showError:@"账号密码错误"];
    }
}

#pragma mark - 显示联系人列表控制器的title（顺传）

/**
 *  执行Segue前调用，顺传数据
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *viewController = segue.destinationViewController;
    viewController.navigationItem.title = [NSString stringWithFormat:@"%@联系人列表", self.accountField.text];
}

#pragma mark - 监听文本框改变

- (void)textFieldDidChange {
    self.loginBtn.enabled = self.accountField.text.length && self.pswField.text.length;
}

@end
