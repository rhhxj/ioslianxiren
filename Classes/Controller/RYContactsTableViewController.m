//
//  RYContactsTableViewController.m
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import "RYContactsTableViewController.h"
#import "RYAddContactViewController.h"
#import "RYContact.h"
#import "RYContactTableViewCell.h"
#import "RYEditContactViewController.h"

@interface RYContactsTableViewController () <RYAddContactViewControllerDelegate, RYEditContactViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation RYContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

/**
 *   懒加载联系人模型数组
 */
- (NSMutableArray *)contacts {
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    
    return _contacts;
}

/**
 *  设置代理
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[RYAddContactViewController class]]) { // 添加联系人
        RYAddContactViewController *addViewController = segue.destinationViewController;
        addViewController.delegate = self;
    } else { // 编辑联系人
        RYEditContactViewController *editContactViewController = segue.destinationViewController;
        editContactViewController.delegate = self;
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        editContactViewController.contact = self.contacts[path.row];
    }
}

#pragma mark - RYEditContactViewControllerDelegate
/**
 *  保存编辑后的联系人
 */
- (void)editContactViewController:(RYEditContactViewController *)editContactViewController didClickSaveContact:(RYContact *)contact {
    [self.tableView reloadData];
}


#pragma mark - RYAddContactViewControllerDelegate

/**
 *  添加联系人界面数据回传
 */
- (void)addContactViewController:(RYAddContactViewController *)addContactViewController didClickAddContact:(RYContact *)contact {
    // 更新数据
    [self.contacts addObject:contact];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RYContactTableViewCell *cell = [RYContactTableViewCell contactTableViewCellWithTableView:tableView];
    
    cell.contact = self.contacts[indexPath.row];
    
    return cell;
}


#pragma mark - 注销

/**
 *  注销
 */
- (IBAction)loginOut:(UIBarButtonItem *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否注销" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
