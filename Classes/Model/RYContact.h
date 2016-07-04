//
//  RYContact.h
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYContact : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNum;

- (instancetype)initWithName:(NSString *)name PhoneNum:(NSString *)phoneNum;
+ (instancetype)contactWithName:(NSString *)name PhoneNum:(NSString *)phoneNum;

@end
