//
//  ODBrandsViewController.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-24.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODBrandsViewController.h"

@interface ODBrandsViewController()

@end

@implementation ODBrandsViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"discover_brands" ofType:@"plist"];
    self.brands = [[NSArray alloc] initWithContentsOfFile:plistPath];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.brands.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *item = [self.brands objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:[item objectForKey:@"image"]];
    return cell;
}

    //选择表视图行时候触发
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ShowDetail"]){
        ODBrandDetailViewController *detailViewController = segue.destinationViewController;
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        NSDictionary *item = [self.brands objectAtIndex:selectedIndex];
        detailViewController.url =  [item objectForKey:@"url"];
        detailViewController.title =  [item objectForKey:@"name"];
    }
}

- (IBAction)backToSuperView:(id)sender {
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}
@end