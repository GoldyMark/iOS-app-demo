//
//  ODPersonalCenterViewController.h
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-27.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ODPersonalCenterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSArray *options;

@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

-(IBAction) showMoreOptions:(id)sender;

- (IBAction)login:(id)sender;

@end