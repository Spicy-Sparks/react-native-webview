#ifndef ContentBlocker_h
#define ContentBlocker_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentBlockerResult : NSObject

@property (nonatomic, readonly, copy) NSString *rulesJSON;
@property (nonatomic, readonly) BOOL truncated;

- (instancetype)initWithJSON:(NSString *)json truncated:(BOOL)truncated;

@end

@interface ContentBlocker : NSObject

+ (nullable ContentBlockerResult *)contentBlockerRulesFromFilterSet:(NSString *)filterSet
                                                              error:(NSError * _Nullable * _Nullable)error;

+ (void)freeContentBlockingRules:(void * _Nullable)rules;

@end

NS_ASSUME_NONNULL_END

#endif /* ContentBlocker_h */
