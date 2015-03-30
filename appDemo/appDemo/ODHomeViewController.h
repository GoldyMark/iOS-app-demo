//
//  ODHomeViewController.h
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-22.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ODHomeViewController: UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>

@property (strong, nonatomic) NSMutableArray *productList;

@property (strong,nonatomic) NSMutableArray *productFilterList;

@property (weak,nonatomic) IBOutlet UICollectionView *collectionView;;

@property (weak,nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak,nonatomic) IBOutlet UIButton *scanButton;

@property (weak,nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)scan:(id)sender;

- (void)filterContentForSearchText:(NSString*)searchText;

@end