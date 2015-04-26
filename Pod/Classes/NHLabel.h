//
//  NLabel.h
//  Pods
//
//  Created by Naithar on 22.04.15.
//
//

#import <UIKit/UIKit.h>

#define ifNSNull(x, y) \
([x isKindOfClass:[NSNull class]]) ? y : (x ?: y)

extern NSString *const kNHLabelCallToSelector;
extern NSString *const kNHLabelSmsToSelector;
extern NSString *const kNHLabelEmailToSelector;
extern NSString *const kNHLabelUrlToSelector;

extern NSString *const kNHLabelResponderAlphaSetting;
extern NSString *const kNHLabelLinkAttributesSetting;
extern NSString *const kNHLabelHashtagAttributesSetting;
extern NSString *const kNHLabelMentionAttributesSetting;

@class NHLabel;

@protocol NHLabelDelegate <NSObject>

@optional
- (void)labelDidBecomeFirstResponder:(NHLabel*)label;
- (void)labelDidResignFirstResponder:(NHLabel*)label;

@end

@interface NHLabel : UILabel

@property (nonatomic, weak) id<NHLabelDelegate> delegate;

@property (nonatomic, assign) UIEdgeInsets textInsets;
@property (nonatomic, assign) BOOL useSingleTouch;

@property (nonatomic, assign) BOOL canPerform;
@property (nonatomic, copy) NSString *actionStringFormat;
@property (nonatomic, copy) NSString*(^actionStringFormatBlock)(NSString *text);

@property (nonatomic, copy) NSArray *additionalSelectors;

@property (nonatomic, copy) NSDictionary *linkAttributes;
@property (nonatomic, copy) NSDictionary *hashtagAttributes;
@property (nonatomic, copy) NSDictionary *mentionAttributes;

@property (nonatomic, assign) CGFloat responderAlpha;

+ (NSMutableDictionary*)defaultSettings;

- (void)addCustomAction:(NSString*)name
              withTitle:(NSString*)title
            andSelector:(SEL)selector;

- (void)addCustomAction:(NSString*)name
              withTitle:(NSString*)title
      localizationTable:(NSString*)table
            andSelector:(SEL)selector;

- (void)removeCustomAction:(NSString*)name;

- (void)findLinksHashtagsAndMentions;
- (void)findLinks:(NSDictionary*)linkAttributes
         hashtags:(NSDictionary*)hashtagAttributes
         mentions:(NSDictionary*)mentionAttributes;

@end
