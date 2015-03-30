//
//  ODKit.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-26.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODKit.h"

@implementation ODKit

+(void) showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:(title ? title : @"信息") message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

@end