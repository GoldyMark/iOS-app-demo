//
//  ODDiscoverView.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-22.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODDiscoverViewController.h"
#import "ODDiscoverViewCell.h"
#import "ODKit.h"

static const int COLUMNS = 2;

@interface ODDiscoverViewController()

@end

@implementation ODDiscoverViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"discover_items" ofType:@"plist"];
    self.items = [[NSArray alloc] initWithContentsOfFile:plistPath];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

/**
 * 行数，取数组元素个数的向上取整值
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return ceil(self.items.count / (float)COLUMNS);
}

/**
 * 列数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return COLUMNS;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ODDiscoverViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSInteger itemIndex = indexPath.section * 2 + indexPath.row;
    if((int)itemIndex >= self.items.count){
        [cell setHidden:YES];
        return cell;
    }
    NSDictionary *item = [self.items objectAtIndex:itemIndex];
    cell.label.text = [item objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:[item objectForKey:@"image"]];
    return cell;
}

/**
 * 点击Cell时弹框显示，可进一步自定义操作
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ODDiscoverViewCell *cell = (ODDiscoverViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if([cell.label.text isEqualToString:@"品牌库"]){
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *brandsViewController = [story instantiateViewControllerWithIdentifier:@"BrandsViewController"];
        [self presentViewController:brandsViewController animated:YES completion:nil];
    }else{
        NSString *message = [NSString stringWithFormat:@"你点击了【%@】",cell.label.text];
        [ODKit showAlertViewWithTitle:nil andMessage:message];
    }
}

@end