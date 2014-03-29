//
//  updateButton.m
//  JSONObject
//
//  Created by Leonard Schuetz on 29.03.14.
//  Copyright (c) 2014 Leonard Schuetz. All rights reserved.
//

#import "updateButton.h"

@implementation updateButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = 5;
    self.layer.backgroundColor = [UIColor colorWithRed:0.18 green:0.68 blue:0.9 alpha:1].CGColor;
}

@end
