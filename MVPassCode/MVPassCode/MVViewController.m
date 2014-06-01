//
//  MVViewController.m
//  MVPassCode
//
//  Created by Moonbeom Kyle KWON on 6/1/14.
//  Copyright (c) 2014 Moonbeom Kyle KWON. All rights reserved.
//

#import "MVViewController.h"

#define PASSCODE_LENGTH 4
#define NUM_OF_BTNS 6
#define BTN_SIZE 60

@interface MVViewController ()

@property (nonatomic, strong) NSMutableArray *passBtnArray;
@property (nonatomic, strong) NSMutableArray *passNumArray;

@end

@implementation MVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // setup pass code
    [[NSUserDefaults standardUserDefaults] setInteger:2014 forKey:@"PASSCODE"];
    _passNumArray = [NSMutableArray new];
    
    
    // setup buttons for unlock pass code
    _passBtnArray = [NSMutableArray new];
    
    for (int i=0; i<NUM_OF_BTNS; i++) {
        
        MVPassButton *passBtn = [[[NSBundle mainBundle] loadNibNamed:@"MVPassButton" owner:self options:nil] lastObject];
        [passBtn setFrame:CGRectMake((i+1)*50, (i+1)*50, BTN_SIZE, BTN_SIZE)];
        [passBtn.passNum setText:[NSString stringWithFormat:@"%d", i]];
        [passBtn setDelegate:self];
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

-(void)touchPassBtn:(NSNumber *)passNum
{
    [_passNumArray addObject:passNum];
    
    if (_passNumArray.count == PASSCODE_LENGTH) {
        [self checkPassCode];
    }
}

-(BOOL)checkPassCode
{
    int userCode = 0;
    int count = _passNumArray.count;
    for (NSNumber *number in _passNumArray) {
        count--;
        int passNum = number.intValue;
        
        for (int i=0; i<count; i++) {
            passNum *= 10;
        }
        
        userCode += passNum;
    }
    
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"PASSCODE"] == userCode) {
        
        NSLog(@"pass code is correct");
        [_passNumArray removeAllObjects];
        
        [_resultLabel setText:@"Pass code is correct"];
        [_resultLabel setBackgroundColor:[UIColor greenColor]];
        [UIView animateWithDuration:0.3 animations:^{
            [_resultLabel setAlpha:1.0];
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0 animations:^{
                [_resultLabel setAlpha:0.0];
            }];
        }];
        
        return YES;
    } else {
        
        NSLog(@"Pass code isn't correct");
        [_passNumArray removeAllObjects];
        
        [_resultLabel setText:@"Pass code isn't correct"];
        [_resultLabel setBackgroundColor:[UIColor redColor]];
        [UIView animateWithDuration:0.3 animations:^{
            [_resultLabel setAlpha:1.0];
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0 animations:^{
                [_resultLabel setAlpha:0.0];
            }];
        }];
        
        return NO;
    }
}

@end
