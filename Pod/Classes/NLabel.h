//
//  NLabel.h
//  Pods
//
//  Created by Naithar on 22.04.15.
//
//

#import <UIKit/UIKit.h>

extern NSString *const kNLabelCallToSelector;
extern NSString *const kNLabelSmsToSelector;
extern NSString *const kNLabelEmailToSelector;
extern NSString *const kNLabelUrlToSelector;

@interface NLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets textInsets;
@property (nonatomic, assign) BOOL useSingleTouch;

@property (nonatomic, assign) BOOL canPerform;
@property (nonatomic, copy) NSString *customActionFormat;
@property (nonatomic, copy) NSString*(^customActionFormatBlock)(NSString *text);

@property (nonatomic, copy) NSArray *customSelectors;

@end
