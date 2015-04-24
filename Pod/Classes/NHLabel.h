//
//  NLabel.h
//  Pods
//
//  Created by Naithar on 22.04.15.
//
//

#import <UIKit/UIKit.h>

extern NSString *const kNHLabelCallToSelector;
extern NSString *const kNHLabelSmsToSelector;
extern NSString *const kNHLabelEmailToSelector;
extern NSString *const kNHLabelUrlToSelector;

@interface NHLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets textInsets;
@property (nonatomic, assign) BOOL useSingleTouch;

@property (nonatomic, assign) BOOL canPerform;
@property (nonatomic, copy) NSString *actionStringFormat;
@property (nonatomic, copy) NSString*(^actionStringFormatBlock)(NSString *text);

@property (nonatomic, copy) NSArray *additionalSelectors;

@property (nonatomic, readonly, copy) NSDictionary *defaultLinkParameters;
@property (nonatomic, readonly, copy) NSDictionary *defaultHashtagParameters;
@property (nonatomic, readonly, copy) NSDictionary *defaultMentionParameters;

- (void)addCustomAction:(NSString*)name
              withTitle:(NSString*)title
            andSelector:(SEL)selector;

- (void)addCustomAction:(NSString*)name
              withTitle:(NSString*)title
      localizationTable:(NSString*)table
            andSelector:(SEL)selector;

- (void)removeCustomAction:(NSString*)name;

- (void)findLinksHashtagsAndMentions;
- (void)findLinks:(NSDictionary*)linksParameters
         hashtags:(NSDictionary*)hashtagsParameters
         mentions:(NSDictionary*)mentionsParameters;

@end
