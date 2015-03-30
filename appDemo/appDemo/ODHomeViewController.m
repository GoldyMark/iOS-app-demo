//
//  ODHomeViewController.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-22.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODHomeViewController.h"
#import "ODProductCell.h"
#import "NSString+FontAwesome.h"
#import "ODKit.h"

static const int PRODUCT_NUM = 20;

@interface ODHomeViewController(){
    NSUserDefaults *productInfo;
    NSMutableOrderedSet *productsInShoppingCart;
    NSString *key;
    BOOL isSearchBarActive;
}

@end

@implementation ODHomeViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    self.collectionView.allowsMultipleSelection = YES;
    self.searchBar.delegate = self;
    
        // init products and userInfo
    self.productList = [[NSMutableArray alloc] init];
    self.productFilterList = [[NSMutableArray alloc] init];
    productsInShoppingCart = [[NSMutableOrderedSet alloc] init];
    productInfo = [NSUserDefaults standardUserDefaults];
    [productInfo removeObjectForKey:@"products"];

    for (int i = 0; i < PRODUCT_NUM; i++) {
        NSString *name = [NSString stringWithFormat:@"商品%d",i+1];
        [self.productList addObject:name];
    }

    [self.scanButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconQrcode] forState:UIControlStateNormal];
    [self.loginButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconSignin] forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearanceWhenContainedIn: [UISearchBar class], nil] setTintColor:[UIColor whiteColor]];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(self.searchBar.showsCancelButton){
        [self searchBarCancelButtonClicked:self.searchBar];
    }
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (isSearchBarActive) {
        return self.productFilterList.count;
    }
    return self.productList.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ODProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *text;
    if (isSearchBarActive) {
        text = [self.productFilterList objectAtIndex:indexPath.row];
    }else{
        text = [self.productList objectAtIndex:indexPath.row];
    }
    cell.label.text = text;
    return cell;
}

-(void) filterContentForSearchText:(NSString *)searchText{
    if([searchText isEqualToString:@""] || searchText == nil){
        self.productFilterList = [self.productList mutableCopy];
    }else{
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains[cd] %@", searchText];
        self.productFilterList = [[self.productList filteredArrayUsingPredicate:predicate] mutableCopy];
    }
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length > 0){
        isSearchBarActive = YES;
//        [self filterContentForSearchText:searchText];
//        [self.collectionView reloadData];
    }else{
        isSearchBarActive = NO;
    }
    [self filterContentForSearchText:searchText];
    [self.collectionView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    isSearchBarActive = NO;
    [self.searchBar resignFirstResponder];
    self.searchBar.text  = @"";
    [self.collectionView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    isSearchBarActive = YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self.searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    isSearchBarActive = NO;
    [self.searchBar setShowsCancelButton:NO animated:YES];
}

/**
 * 点击Cell时将所选商品添加进数据库并保存
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ODProductCell *cell = (ODProductCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
    [productsInShoppingCart addObject:cell.label.text];
    [productInfo setObject:[productsInShoppingCart array] forKey:@"products"];
    [productInfo synchronize];
}

-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    ODProductCell *cell = (ODProductCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:0 green:122/255.0 blue:1 alpha:1]];
    [productsInShoppingCart removeObject:cell.label.text];
    [productInfo setObject:[productsInShoppingCart array] forKey:@"products"];
    [productInfo synchronize];
}

-(void) scan:(id)sender {
    [ODKit showAlertViewWithTitle:nil andMessage:@"调用ZXing库实现扫描二维码、条形码功能，暂未实现"];
}

@end