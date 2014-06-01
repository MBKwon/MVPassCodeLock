//
//  MVPassButton.m
//  MVPassCode
//
//  Created by Moonbeom Kyle KWON on 6/1/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import "MVPassButton.h"


@interface MVPassButton ()

@property (nonatomic, assign) float xDirection;
@property (nonatomic, assign) float yDirection;

@end

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
    
    _xDirection = 0.5;
    _yDirection = 0.5;
    [NSTimer scheduledTimerWithTimeInterval:0.01
                                     target:self
                                   selector:@selector(moveBtn)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)moveBtn
{
    [self checkCollisionInScreen];
    if ([self checkCollision] == NO) {
        
        CGPoint center = self.center;
        center.x += _xDirection;
        center.y += _yDirection;
        [self setCenter:center];
    }
}

-(BOOL)checkCollision
{
    return NO;
}

-(void)checkCollisionInScreen
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBounds.size;
    CGRect btnFrame = self.frame;
    
    if (_xDirection < 0) {
        
        if (btnFrame.origin.x + _xDirection < 0) {
            _xDirection = _xDirection * -1;
        }
        
    } else if (_xDirection > 0) {
        
        if (btnFrame.origin.x + btnFrame.size.width + _xDirection > screenSize.width) {
            _xDirection = _xDirection * -1;
        }
    }
    
    if (_yDirection < 0) {
        
        if (btnFrame.origin.y + _yDirection < 0) {
            _yDirection = _yDirection * -1;
        }
        
    } else if (_yDirection > 0) {
        
        if (btnFrame.origin.y + btnFrame.size.height + _yDirection > screenSize.height) {
            _yDirection = _yDirection * -1;
        }
        
    }
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
    
    if ([_delegate respondsToSelector:@selector(touchPassBtn:)] == YES) {
        
        int passNum = self.passNum.text.intValue;
        [_delegate touchPassBtn:[NSNumber numberWithInt:passNum]];
    }
}

@end
