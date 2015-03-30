//
//  ODLoginViewController.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-24.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODLoginViewController.h"
#import "ODKit.h"
//#import "NSString+FontAwesome.h"

@interface ODLoginViewController()

-(void) saveUsername:(NSString *)username andAvatar:(NSString *)imagePath;

-(void) showErrorMessage:(NSString *) msg;

-(void) hideErrorMessage;

-(void) setOnline:(BOOL)isOnline;

@end

@implementation ODLoginViewController{
    NSUserDefaults *userInfo;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    
        //圆角按钮
    [self.loginButton.layer setCornerRadius:15.0f];
    [self.logoutButton.layer setCornerRadius:15.0f];
    
        //圆角边框头像
    self.avatarView.layer.cornerRadius = 15.0f;
    self.avatarView.clipsToBounds = YES;
    self.avatarView.layer.borderWidth = 3.0f;
    self.avatarView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    userInfo = [NSUserDefaults standardUserDefaults];

    if([@"YES" isEqualToString:[userInfo objectForKey:@"online"]]){
        UIView *loginView = [self.view viewWithTag:1];
        UIView *logoutView = [self.view viewWithTag:2];
        [loginView setHidden:YES];
        [logoutView setHidden:NO];
        self.avatarView.image = [UIImage imageNamed:[userInfo objectForKey:@"image"]];
        self.usernameLabel.text = [userInfo objectForKey:@"username"];
    }
    [self.userField becomeFirstResponder];
}

-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(void) showErrorMessage:(NSString *)msg{
    self.errorLabel.text = msg;
    self.errorLabel.hidden = NO;
}

-(void) hideErrorMessage{
    self.errorLabel.text = @"";
    self.errorLabel.hidden = YES;
}

-(void) saveUsername:(NSString *)username andAvatar:(NSString *)imagePath{
    [userInfo removeObjectForKey:@"username"];
    [userInfo removeObjectForKey:@"image"];
    [userInfo setObject:username forKey:@"username"];
    [userInfo setObject:imagePath forKey:@"image"];
    [userInfo synchronize];
}

-(void) setOnline:(BOOL)isOnline{
    NSString *isOnlineStr = (isOnline == YES ? @"YES" :@"NO");
    [userInfo setObject:isOnlineStr forKey:@"online"];
    [userInfo synchronize];
}

- (void)isPasswordVisible:(id)sender{
    [self.passwordField setSecureTextEntry:[(UISwitch *)sender isOn]];
}

/**
 * 1、在客户端验证账号和密码是否合法；
 * 2、将用户名、密码加密发送请求到服务器；
 * 3、服务器端验证用户名和密码md5码是否匹配，并返回信息；
 * 4、返回200则登陆成功，否则登陆失败，并显示失败原因；
 * 此处省略以上步骤
 */
- (void)login:(id)sender{
    NSString *username = self.userField.text;
    NSString *password = self.passwordField.text;
    NSString *imagePath = @"goldymark.jpg";

    if([@"" isEqualToString:username] || [@"" isEqualToString:password]){
        [self showErrorMessage:@"用户名和密码不能为空"];
    }else if([@"test" isEqualToString:[username lowercaseString]]){
        if([@"test" isEqualToString:password]){
            [self hideErrorMessage];
            self.avatarView.image = [UIImage imageNamed:imagePath];
            UIView *loginView = [self.view viewWithTag:1];
            UIView *logoutView = [self.view viewWithTag:2];
            [loginView setHidden:YES];
            [logoutView setHidden:NO];
            self.usernameLabel.text = username;
            [self saveUsername:username andAvatar:imagePath];
            [self setOnline:YES];
        }
    }else{
        [self showErrorMessage:@"用户名、密码不匹配"];
    }
}

- (void)logout:(id)sender{
    self.userField.text = @"";
    self.passwordField.text = @"";
    [userInfo removeObjectForKey:@"username"];
    [userInfo removeObjectForKey:@"image"];
    self.avatarView.image = [UIImage imageNamed:@"default_avatar.jpg"];
    UIView *loginView = [self.view viewWithTag:1];
    UIButton *logoutView = (UIButton *)[self.view viewWithTag:2];
    [loginView setHidden:NO];
    [logoutView setHidden:YES];
    [self setOnline:NO];
}

- (void)inputUsername:(id)sender{
    [self.passwordField becomeFirstResponder];
}

- (void)inputPassword:(id)sender{
    [sender resignFirstResponder];
    [self.loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)forgetPassword:(id)sender{
    [ODKit showAlertViewWithTitle:nil andMessage:@"你点击了【忘记密码】"];
}

- (void)quickSignUp:(id)sender {
    [ODKit showAlertViewWithTitle:nil andMessage:@"Just jump to another view"];
}

- (void)backToSuperView:(id)sender {
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

@end