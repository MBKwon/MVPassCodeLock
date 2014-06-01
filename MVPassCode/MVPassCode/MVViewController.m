//
//  MVViewController.m
//  MVPassCode
//
//  Created by Moonbeom Kyle KWON on 6/1/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import "MVViewController.h"
#import "MVPass Library/MVPassButton.h"

#define NUM_OF_BTNS 4
#define BTN_SIZE 60

@interface MVViewController ()

@property (nonatomic, strong) NSMutableArray *passBtnArray;

@end

@implementation MVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    
    _passBtnArray = [NSMutableArray new];
    
    for (int i=0; i<NUM_OF_BTNS; i++) {
        
        MVPassButton *passBtn = [[[NSBundle mainBundle] loadNibNamed:@"MVPassButton" owner:self options:nil] lastObject];
        [passBtn setFrame:CGRectMake((i+1)*50, (i+1)*50, BTN_SIZE, BTN_SIZE)];
        [passBtn.passNum setText:[NSString stringWithFormat:@"%d", i]];
        [self.view addSubview:passBtn];
        
        [_passBtnArray addObject:passBtn];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
