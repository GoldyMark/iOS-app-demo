//
//  ODPersonalCenterViewController.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-27.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODPersonalCenterViewController.h"
#import "ODKit.h"
#import "NSString+FontAwesome.h"

@interface ODPersonalCenterViewController()

@end

@implementation ODPersonalCenterViewController{
    NSUserDefaults *userInfo;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    
        //圆角按钮
    [self.loginButton.layer setCornerRadius:15.0f];
    
        //圆角边框头像
    [self.avatarImageView.layer setCornerRadius:15.0f];
    self.avatarImageView.clipsToBounds = YES;
    self.avatarImageView.layer.borderWidth = 3.0f;
    self.avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
        // init userInfo
    userInfo = [NSUserDefaults standardUserDefaults];
    [self.moreButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconEllipsisHorizontal] forState:UIControlStateNormal];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"personal_options" ofType:@"plist"];
    self.options = [[NSArray alloc] initWithContentsOfFile:plistPath];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    BOOL isOnline = [@"yes" isEqualToString:[[userInfo objectForKey:@"online"] lowercaseString]];
    if(isOnline){
        self.avatarImageView.image = [UIImage imageNamed:[userInfo objectForKey:@"image"]];
        [self.loginButton setTitle:@"注销" forState:UIControlStateNormal];
    }else{
        self.avatarImageView.image = [UIImage imageNamed:@"default_avatar.jpg"];
        [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    }
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.options.count;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray *)self.options[section]).count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *option = [[self.options objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = [option objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:[option objectForKey:@"image"]];
    if([@"客服电话" isEqualToString:cell.textLabel.text]){
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        NSString *text = [NSString stringWithFormat:@"%@   %@",cell.textLabel.text,[option objectForKey:@"telephone"]];
        cell.textLabel.text = text;
        cell.tag = 10;
    }

    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.tag == 10){
        NSDictionary *option = [[self.options objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        NSString *phoneUrl = [NSString stringWithFormat:@"tel://%@",[option objectForKey:@"telephone"]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneUrl]];
    }else{
            //判断登陆状态
        BOOL isOnline = [@"yes" isEqualToString:[[userInfo objectForKey:@"online"] lowercaseString]];
        if(isOnline){
            [ODKit showAlertViewWithTitle:nil andMessage:@"进入相应功能页面"];
        }else{
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            UIViewController *loginViewController = [story instantiateViewControllerWithIdentifier:@"LoginNavigationController"];
            [self presentViewController:loginViewController animated:YES completion:nil];
        }
    }
}

-(void) showMoreOptions:(id)sender{
    [ODKit showAlertViewWithTitle:@"Another View" andMessage:@"显示公司简介、清除缓存、软件评价、联系我们、意见反馈、版本信息等功能"];
}

- (IBAction)login:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if([@"登陆" isEqualToString:btn.titleLabel.text]){
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *loginViewController = [story instantiateViewControllerWithIdentifier:@"LoginNavigationController"];
        [self presentViewController:loginViewController animated:YES completion:nil];
    }else{
        self.avatarImageView.image = [UIImage imageNamed:@"default_avatar.jpg"];
        [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        
        [userInfo removeObjectForKey:@"username"];
        [userInfo removeObjectForKey:@"image"];
        [userInfo setObject:@"NO" forKey:@"online"];
        [userInfo synchronize];
    }
}

@end