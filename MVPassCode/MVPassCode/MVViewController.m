//
//  MVViewController.m
//  MVPassCode
//
//  Created by Moonbeom Kyle KWON on 6/1/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import "MVViewController.h"
#import "MVPass Library/MVPassButton.h"

@interface MVViewController ()

@end

@implementation MVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MVPassButton *passBtn = [[[NSBundle mainBundle] loadNibNamed:@"MVPassButton" owner:self options:nil] lastObject];
    [passBtn setFrame:CGRectMake(100, 100, 80, 80)];
    [self.view addSubview:passBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
