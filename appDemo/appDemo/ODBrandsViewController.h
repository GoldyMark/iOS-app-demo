//
//  ODBrandsViewController.h
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-24.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ODBrandDetailViewController.h"

@interface ODBrandsViewController : UITableViewController

- (IBAction)backToSuperView:(id)sender;

@property (strong,nonatomic) NSArray *brands;

@end