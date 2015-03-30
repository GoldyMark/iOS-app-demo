//
//  ODShoppingCartViewController.h
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-26.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ODShoppingCartViewController:UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *shoppingCartTable;

@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

- (IBAction)edit:(id)sender;

- (IBAction)clear:(id)sender;

- (IBAction)pay:(id)sender;

@end