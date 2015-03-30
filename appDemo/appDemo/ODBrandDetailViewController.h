//
//  ODBrandDetailViewController.h
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-24.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ODBrandDetailViewController : UIViewController<UIWebViewDelegate>

@property (weak,nonatomic) IBOutlet UIWebView *webView;

@property (weak,nonatomic) NSString *url;

@end