//
//  SHOnePixelCell.m
//  SHDemo
//
//  Created by yzq on 2019/4/2.
//  Copyright © 2019 yzq. All rights reserved.
//

#import "SHOnePixelCell.h"

@implementation SHOnePixelCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:87.0f/255.0f blue:27.0f/255.0f alpha:1];
    }
    return self;
}

@end
