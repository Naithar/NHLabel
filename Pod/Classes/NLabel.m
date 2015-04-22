//
//  NLabel.m
//  Pods
//
//  Created by Naithar on 22.04.15.
//
//

#import "NLabel.h"

@implementation NLabel

@end

//
//
//@interface CustomActionLabel : UILabel
//
//@property (nonatomic, assign) BOOL canPerform;
//@property (nonatomic, copy) NSString *customActionFormat;
//@property (nonatomic, copy) NSString*(^customActionFormatBlock)(NSString *text);
//
//@property (nonatomic, copy) NSArray *customSelectors;
//
//@end
//


//class PageViewLabel : UILabel {
//    var textInsets : UIEdgeInsets = UIEdgeInsetsZero
//
//    override func drawTextInRect(rect: CGRect) {
//        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, self.textInsets))
//    }
//    }


//- (CGRect)textRectForBounds:(CGRect)bounds
//limitedToNumberOfLines:(NSInteger)numberOfLines
//{
//    bounds = UIEdgeInsetsInsetRect(bounds, self.textInsets);
//    if (!self.attributedText) {
//        return [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
//    }
//
//    CGRect textRect = bounds;
//
//    // Calculate height with a minimum of double the font pointSize, to ensure that CTFramesetterSuggestFrameSizeWithConstraints doesn't return CGSizeZero, as it would if textRect height is insufficient.
//    textRect.size.height = MAX(self.font.lineHeight * MAX(2, numberOfLines), bounds.size.height);
//
//    // Adjust the text to be in the center vertically, if the text size is smaller than bounds
//    CGSize textSize = CTFramesetterSuggestFrameSizeWithConstraints([self framesetter], CFRangeMake(0, (CFIndex)[self.attributedText length]), NULL, textRect.size, NULL);
//    textSize = CGSizeMake(CGFloat_ceil(textSize.width), CGFloat_ceil(textSize.height)); // Fix for iOS 4, CTFramesetterSuggestFrameSizeWithConstraints sometimes returns fractional sizes
//
//    if (textSize.height < bounds.size.height) {
//        CGFloat yOffset = 0.0f;
//        switch (self.verticalAlignment) {
//            case TTTAttributedLabelVerticalAlignmentCenter:
//                yOffset = CGFloat_floor((bounds.size.height - textSize.height) / 2.0f);
//                break;
//            case TTTAttributedLabelVerticalAlignmentBottom:
//                yOffset = bounds.size.height - textSize.height;
//                break;
//            case TTTAttributedLabelVerticalAlignmentTop:
//            default:
//                break;
//        }
//
//        textRect.origin.y += yOffset;
//    }
//
//    return textRect;
//}
//

//@implementation CustomActionLabel
//
//-(instancetype)init {
//    self = [super init];
//    if (self) {
//        _canPerform = YES;
//        _customSelectors = @[];
//    }
//    return self;
//}
//
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        _canPerform = YES;
//        _customSelectors = @[];
//    }
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        _canPerform = YES;
//        _customSelectors = @[];
//    }
//    return self;
//}
//
//- (NSString*)createTextForAction {
//    if (self.customActionFormatBlock) {
//        return self.customActionFormatBlock(self.text);
//    }
//
//    if (self.customActionFormat != nil) {
//        NSString *tempText = [NSString stringWithFormat:self.customActionFormat, [self.text stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@/"]]];
//
//        return tempText;
//    }
//
//    return self.text;
//}
//
//- (void)copy:(NSObject*)sender {
//    [self resignFirstResponder];
//    [UIPasteboard generalPasteboard].string = [self createTextForAction];
//    [self resignFirstResponder];
//}
//
//- (void)callTo:(NSObject*)sender {
//    [self resignFirstResponder];
//    [WebLoadingViewController
//     openURL:[NSURL
//              URLWithString:[NSString
//                             stringWithFormat:@"tel:%@",
//                             [self createTextForAction]]]];
//    [self resignFirstResponder];
//}
//
//- (void)smsTo:(NSObject*)sender {
//    [self resignFirstResponder];
//    [WebLoadingViewController
//     openURL:[NSURL
//              URLWithString:[NSString
//                             stringWithFormat:@"sms:%@",
//                             [self createTextForAction]]]];
//    [self resignFirstResponder];
//}
//
//- (void)emailTo:(NSObject*)sender {
//    [self resignFirstResponder];
//    [WebLoadingViewController
//     openURL:[NSURL
//              URLWithString:[NSString
//                             stringWithFormat:@"mailto:%@",
//                             [self createTextForAction]]]];
//
//    [self resignFirstResponder];
//}
//
//- (void)urlTo:(NSObject*)sender {
//    [self resignFirstResponder];
//    [WebLoadingViewController
//     openURL:[NSURL
//              URLWithString:[self createTextForAction]]];
//    [self resignFirstResponder];
//}
//
//- (void)menuDidHide:(NSObject*)sender {
//    //    dispatch_async(dispatch_get_main_queue(), ^{
//    [ITCAsync mainAfter:0.25 block:^(ITCOperation *_) {
//        [self resignFirstResponder];
//    }];
//
//    //    });
//
//}
//
//- (BOOL)becomeFirstResponder {
//    if ([super becomeFirstResponder]) {
//        self.alpha = 0.6;
//
//        NSArray *customMenuItems = @[
//                                     [[UIMenuItem alloc]
//                                      initWithTitle:NSLocalizedString(@"customLabel.call", nil) action:@selector(callTo:)],
//                                     [[UIMenuItem alloc]
//                                      initWithTitle:NSLocalizedString(@"customLabel.sms", nil)
//                                      action:@selector(smsTo:)],
//                                     [[UIMenuItem alloc]
//                                      initWithTitle:NSLocalizedString(@"customLabel.email", nil)
//                                      action:@selector(emailTo:)],
//                                     [[UIMenuItem alloc]
//                                      initWithTitle:NSLocalizedString(@"customLabel.url", nil)
//                                      action:@selector(urlTo:)],
//                                     ];
//
//        [[UIMenuController sharedMenuController] setMenuItems:customMenuItems];
//        [[UIMenuController sharedMenuController] setTargetRect:self.bounds inView:self];
//        [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
//
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(menuDidHide:)
//                                                     name:UIMenuControllerWillHideMenuNotification
//                                                   object:nil];
//    }
//
//    return [super becomeFirstResponder];
//}
//
//- (BOOL)resignFirstResponder {
//    self.alpha = 1;
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIMenuControllerWillHideMenuNotification
//                                                  object:nil];
//    return [super resignFirstResponder];
//}
//
//- (BOOL)canBecomeFirstResponder {
//    return self.canPerform;
//}
//
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    return (self.canPerform
//            && (action == @selector(copy:)
//                || ([self.customSelectors containsObject:NSStringFromSelector(action)])));
//}
//
//@end