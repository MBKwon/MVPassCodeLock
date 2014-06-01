//
//  MVViewController.h
//  MVPassCode
//
//  Created by Moonbeom Kyle KWON on 6/1/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPassButton.h"

@interface MVViewController : UIViewController <MVPassBtnDelegate>

@property (nonatomic, strong) IBOutlet UILabel *resultLabel;

@end
