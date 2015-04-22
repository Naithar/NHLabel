//
//  NViewController.m
//  NLabel
//
//  Created by Naithar on 04/18/2015.
//  Copyright (c) 2014 Naithar. All rights reserved.
//

#import "NViewController.h"
#import <NLabel.h>

@interface NViewController ()


@property (nonatomic, strong) NLabel *label;
@end

@implementation NViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    self.label = [[NLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.label.text = @"text";
    self.label.backgroundColor = [UIColor greenColor];
    self.label.canPerform = YES;
    self.label.customSelectors = @[kNLabelSmsToSelector];
//    label.canResignFirstResponder


//    self.longPressRecognizer = [[UITapGestureRecognizer alloc]
//                                initWithTarget:self
//                                action:@selector(longPressRecognizerAction:)];
//        self.longPressRecognizer.numberOfTouchesRequired = 1;
//        self.longPressRecognizer.numberOfTapsRequired = 1;
//    [self.view addGestureRecognizer:self.longPressRecognizer];


    [self.view addSubview:self.label];
}

//- (void)longPressRecognizerAction:(UITapGestureRecognizer*)recognizer {
//    //    if (recognizer.state == UIGestureRecognizerStateBegan) {
//    [self.label becomeFirstResponder];
//    //    }
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
