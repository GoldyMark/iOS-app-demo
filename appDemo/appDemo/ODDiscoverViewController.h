//
//  ODDiscoverView.h
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-22.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ODDiscoverViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) NSArray * items;

@property (weak,nonatomic) IBOutlet UICollectionView *collectionView;

@end