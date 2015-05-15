//
//  NViewController.m
//  NLabel
//
//  Created by Naithar on 04/18/2015.
//  Copyright (c) 2014 Naithar. All rights reserved.
//

#import "NViewController.h"
#import <NLabel/NHLabel.h>

@interface NViewController ()<NHLabelDelegate>


@property (nonatomic, strong) NHLabel *label;
@end

@implementation NViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.label = [[NHLabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    self.label.text = @"text @dsa #dsa http://google.com #d";

        self.label.lineHeight = 100;
    [self.label findLinksHashtagsAndMentions];
    self.label.backgroundColor = [UIColor lightGrayColor];
    self.label.canPerform = YES;
    self.label.additionalSelectors = @[kNHLabelSmsToSelector];
    self.label.useSingleTouch = YES;
    [self.label addCustomAction:@"name" withTitle:@"title" andSelector:@selector(u:)];
    self.label.delegate = self;
    [self.label sizeToFit];


    self.label.text = @"text #d";

    [self.label findLinksHashtagsAndMentions];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, 300, 100)];
    label.attributedText = self.label.attributedText;

    [self.view addSubview:self.label];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)u:(UIMenuController*)sender {
    if ([self.label isFirstResponder]) {
            NSLog(@"dsadas");
    }
}

- (void)labelDidBecomeFirstResponder:(NHLabel *)label {
    NSLog(@"responder");
}

- (void)labelDidResignFirstResponder:(NHLabel *)label {
    NSLog(@"resigned");
}

@end
