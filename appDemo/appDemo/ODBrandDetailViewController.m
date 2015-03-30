//
//  ODBrandDetailViewController.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-24.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODBrandDetailViewController.h"

@interface ODBrandDetailViewController()

@end

@implementation ODBrandDetailViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    return self;
//}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:request];
}



@end