//
//  ODDiscoverViewCell.m
//  AutoPartStore
//
//  Created by GoldyMark on 15-3-22.
//  Copyright (c) 2015年 GoldyMark. All rights reserved.
//

#import "ODDiscoverViewCell.h"

@implementation ODDiscoverViewCell

- (id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    return self;
}

-(void) prepareForReuse{
    [super prepareForReuse];
    self.imageView.image = nil;
    self.label.text = @"";
}

@end