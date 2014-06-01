//
//  MVPassButton.h
//  MVPassCode
//
//  Created by Moonbeom Kyle KWON on 6/1/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MVPassBtnDelegate <NSObject>

-(void)touchPassBtn:(NSNumber *)passNum;

@end

@interface MVPassButton : UIControl

@property (nonatomic, strong) IBOutlet UILabel *passNum;
@property (nonatomic, strong) id<MVPassBtnDelegate> delegate;

@end
