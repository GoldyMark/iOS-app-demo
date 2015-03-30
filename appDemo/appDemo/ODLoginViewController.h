//
//  ODLoginViewController.h
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-24.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ODLoginViewController : UIViewController<UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatarView;

@property (weak, nonatomic) IBOutlet UITextField *userField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordButton;

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

-(IBAction) isPasswordVisible:(id)sender;

-(IBAction) inputUsername:(id)sender;

-(IBAction) inputPassword:(id)sender;

-(IBAction) login:(id)sender;

-(IBAction) logout:(id)sender;

-(IBAction) forgetPassword:(id)sender;

-(IBAction) quickSignUp:(id)sender;

- (IBAction)backToSuperView:(id)sender;

@end