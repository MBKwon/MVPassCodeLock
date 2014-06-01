//
//  MVPassButton.m
//  MVPassCode
//
//  Created by Moonbeom Kyle KWON on 6/1/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import "MVPassButton.h"

@implementation MVPassButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self addTarget:self action:@selector(touchDownBtn:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUpBtn:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)touchDownBtn:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:0.1];
    }];
}

-(void)touchUpBtn:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:1.0];
    }];
}

@end
