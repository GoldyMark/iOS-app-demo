//
//  ODRootViewController.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-22.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODTabBarController.h"
#import "FontAwesomeKit/FAKFontAwesome.h"

#define DEEP_RED_COLOR [UIColor colorWithRed:176/255.0 green:23/255.0 blue:31/255.0 alpha:1]

static const int ICON_SIZE = 26;

@interface ODTabBarController()

@end

@implementation ODTabBarController

- (void) viewDidLoad{
    [super viewDidLoad];
    self.tabBar.selectedImageTintColor = DEEP_RED_COLOR;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor]} forState:UIControlStateNormal];

    [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:DEEP_RED_COLOR} forState:UIControlStateSelected];

    for(int i = 0 ;i < self.tabBar.items.count;i++){
        UIBarItem *item = self.tabBar.items[i];
        CGSize iconRect = CGSizeMake(25, 25);
        switch (i) {
                    //homeBtn
            case 0:
                item.image = [[FAKFontAwesome homeIconWithSize:ICON_SIZE] imageWithSize:iconRect];
                break;
                    //discoverBtn
            case 1:
                item.image = [[FAKFontAwesome compassIconWithSize:ICON_SIZE] imageWithSize:iconRect];
                break;
                    //shoppingCartBtn
            case 2:
                item.image = [[FAKFontAwesome shoppingCartIconWithSize:ICON_SIZE] imageWithSize:iconRect];
                break;
                    //myCenterBtn
            case 3:
                item.image = [[FAKFontAwesome userIconWithSize:ICON_SIZE] imageWithSize:iconRect];
                break;
        }
    }
}

@end