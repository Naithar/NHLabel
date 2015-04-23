//
//  NLabel.m
//  Pods
//
//  Created by Naithar on 22.04.15.
//
//

#import "NLabel.h"

NSString *const kNLabelCallToSelector = @"callTo:";
NSString *const kNLabelSmsToSelector = @"smsTo:";
NSString *const kNLabelEmailToSelector = @"emailTo:";
NSString *const kNLabelUrlToSelector = @"urlTo:";

@interface NLabel ()

@property (nonatomic, strong) UITapGestureRecognizer *longPressRecognizer;

@end

@implementation NLabel


- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.userInteractionEnabled = YES;
    
    _canPerform = YES;
    _customSelectors = @[];
    _textInsets = UIEdgeInsetsZero;


    self.longPressRecognizer = [[UITapGestureRecognizer alloc]
                                initWithTarget:self
                                action:@selector(longPressRecognizerAction:)];
    self.longPressRecognizer.numberOfTouchesRequired = 1;
    self.longPressRecognizer.numberOfTapsRequired = 1;
    [self addGestureRecognizer:self.longPressRecognizer];
}

- (void)longPressRecognizerAction:(UITapGestureRecognizer*)recognizer {
    if (!self.isFirstResponder) {
        [self becomeFirstResponder];
    }
    else {
        [UIView animateWithDuration:0.3 animations:^{
            [[UIMenuController sharedMenuController] setMenuVisible:NO];
            [self resignFirstResponder];

        }];
    }
}


- (NSString*)createTextForAction {
    if (self.customActionFormatBlock) {
        return self.customActionFormatBlock(self.text);
    }

    if (self.customActionFormat != nil) {
        NSString *tempText = [NSString
                              stringWithFormat:self.customActionFormat,
                              [self.text
                               stringByTrimmingCharactersInSet:[NSCharacterSet
                                                                characterSetWithCharactersInString:@"@/"]]];

        return tempText;
    }

    return self.text;
}

- (void)copy:(NSObject*)sender {
    [self resignFirstResponder];
    [UIPasteboard generalPasteboard].string = [self createTextForAction];
    [self resignFirstResponder];
}

- (void)callTo:(NSObject*)sender {
    [self resignFirstResponder];
    [[UIApplication sharedApplication]
     openURL:[NSURL
              URLWithString:[NSString
                             stringWithFormat:@"tel:%@",
                             [self createTextForAction]]]];
    [self resignFirstResponder];
}

- (void)smsTo:(NSObject*)sender {
    [self resignFirstResponder];
    [[UIApplication sharedApplication]
     openURL:[NSURL
              URLWithString:[NSString
                             stringWithFormat:@"sms:%@",
                             [self createTextForAction]]]];
    [self resignFirstResponder];
}

- (void)emailTo:(NSObject*)sender {
    [self resignFirstResponder];
    [[UIApplication sharedApplication]
     openURL:[NSURL
              URLWithString:[NSString
                             stringWithFormat:@"mailto:%@",
                             [self createTextForAction]]]];

    [self resignFirstResponder];
}

- (void)urlTo:(NSObject*)sender {
    [self resignFirstResponder];
    [[UIApplication sharedApplication]
     openURL:[NSURL
              URLWithString:[self createTextForAction]]];
    [self resignFirstResponder];
}

- (void)menuDidHide:(NSObject*)sender {
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
    if (self.isFirstResponder
        || !self.canBecomeFirstResponder) {
        return NO;
    }

    if ([super becomeFirstResponder]) {
        self.alpha = 0.6;

        NSArray *customMenuItems = @[
                                     [[UIMenuItem alloc]
                                      initWithTitle:NSLocalizedStringFromTable(@"NLabel.call", @"NLabel", nil)
                                      action:@selector(callTo:)],
                                     [[UIMenuItem alloc]
                                      initWithTitle:NSLocalizedStringFromTable(@"NLabel.sms", @"NLabel", nil)
                                      action:@selector(smsTo:)],
                                     [[UIMenuItem alloc]
                                      initWithTitle:NSLocalizedStringFromTable(@"NLabel.email", @"NLabel", nil)
                                      action:@selector(emailTo:)],
                                     [[UIMenuItem alloc]
                                      initWithTitle:NSLocalizedStringFromTable(@"NLabel.url", @"NLabel", nil)
                                      action:@selector(urlTo:)],
                                     ];

        [[UIMenuController sharedMenuController] setMenuItems:customMenuItems];
        [[UIMenuController sharedMenuController] setTargetRect:self.bounds inView:self];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(menuDidHide:)
                                                     name:UIMenuControllerWillHideMenuNotification
                                                   object:nil];
    }

    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {

    if (self.isFirstResponder
        && self.canResignFirstResponder) {
        self.alpha = 1;
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIMenuControllerWillHideMenuNotification
                                                      object:nil];
        return [super resignFirstResponder];
    }

    return NO;
}

- (BOOL)canBecomeFirstResponder {
    return self.canPerform;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (self.canPerform
            && (action == @selector(copy:)
                || ([self.customSelectors
                     containsObject:NSStringFromSelector(action)])));
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textInsets)];
}

- (CGRect)textRectForBounds:(CGRect)bounds
     limitedToNumberOfLines:(NSInteger)numberOfLines {
    return [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.textInsets)
             limitedToNumberOfLines:numberOfLines];
}
@end