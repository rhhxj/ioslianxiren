//
//  RYContact.m
//  18-Contacts
//
//  Created by Touptek on 16/5/30.
//  Copyright © 2016年 com.test. All rights reserved.
//

#import "RYContact.h"

@implementation RYContact

- (instancetype)initWithName:(NSString *)name PhoneNum:(NSString *)phoneNum {
    self = [super init];
    if (self) {
        _name = name;
        _phoneNum = phoneNum;
    }
    return self;
}

+ (instancetype)contactWithName:(NSString *)name PhoneNum:(NSString *)phoneNum {
    return [[self alloc] initWithName:name PhoneNum:phoneNum];
}

@end
