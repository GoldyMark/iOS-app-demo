//
//  ODShoppingCartViewController.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-26.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODShoppingCartViewController.h"
#import "ODKit.h"
#import "NSString+FontAwesome.h"

@interface ODShoppingCartViewController()

@end

@implementation ODShoppingCartViewController{
    @private
    NSMutableArray *products;
    NSString *key;
    NSUserDefaults *productInfo;
}

-(void) viewDidLoad{
    [super viewDidLoad];

    productInfo = [NSUserDefaults standardUserDefaults];
    [self.editButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconEdit] forState:UIControlStateNormal];
    products = [[productInfo objectForKey:@"products"] mutableCopy];
}

-(void) viewWillAppear:(BOOL)animated{
    products = [[productInfo objectForKey:@"products"] mutableCopy];
    [super viewDidAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated{
        //可以先在viewWillAppear里生成一个products的hash code，然后在这里进行对比，hash code不相同的情况下再进行写入操作，减少io流
        //不过在此先省略
    [productInfo setObject:products forKey:@"products"];
    [productInfo synchronize];
    
        //如果处于编辑状态，则退出编辑状态
    if([self.shoppingCartTable isEditing]){
        [self.editButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconEdit] forState:UIControlStateNormal];
        [self.shoppingCartTable setEditing:NO animated:YES];
        [self.toolbar setHidden:NO];
    }
    [super viewWillDisappear:animated];
}

-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(products){
        return products.count;
    }else{
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(products){
        cell.textLabel.text = (NSString *)[products objectAtIndex:indexPath.row];
    }
    return cell;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [products removeObjectAtIndex:indexPath.row];
//    [productInfo setObject:products forKey:@"products"];
//    [productInfo synchronize];
    [self.shoppingCartTable reloadData];
}

- (IBAction)edit:(id)sender {
    if(!products || products.count == 0){
        [ODKit showAlertViewWithTitle:nil andMessage:@"购物车还没有商品，先去逛逛呗"];
        return;
    }
    if([self.shoppingCartTable isEditing]){
        [self.editButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconEdit] forState:UIControlStateNormal];
    }else{
        [self.editButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconOk] forState:UIControlStateNormal];
    }
    [self.shoppingCartTable setEditing:!self.shoppingCartTable.editing animated:YES];
    [self.toolbar setHidden:self.shoppingCartTable.editing];
}

- (IBAction)clear:(id)sender {
    products = nil;

    [self.shoppingCartTable reloadData];
}

- (IBAction)pay:(id)sender {
    if(!products || products.count == 0){
        [ODKit showAlertViewWithTitle:nil andMessage:@"购物车还没有商品，先去逛逛呗"];
        return;
    }
    BOOL isOnline = [productInfo boolForKey:@"online"];
    if(isOnline){
        NSString *message = [NSString stringWithFormat:@"欢迎您进行购物，购物车共有%ld件商品，将跳转到【支付】页面",(long)products.count];
        [ODKit showAlertViewWithTitle:nil andMessage:message];
    }else{
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *loginViewController = [story instantiateViewControllerWithIdentifier:@"LoginNavigationController"];
        [self presentViewController:loginViewController animated:YES completion:nil];
    }
}

@end