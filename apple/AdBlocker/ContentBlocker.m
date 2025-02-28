#import <Foundation/Foundation.h>
#import "ContentBlocker.h"
#import "AdblockRust.h"

@implementation ContentBlockerResult

- (instancetype)initWithJSON:(NSString*)json truncated:(BOOL)truncated {
    if ((self = [super init])) {
        _rulesJSON = json;
        _truncated = truncated;
    }
    return self;
}

@end

@implementation ContentBlocker

+ (nullable ContentBlockerResult*)contentBlockerRulesFromFilterSet:(NSString*)filterSet
                                                             error:(NSError**)error {
    if (!filterSet || filterSet.length == 0) {
        return nil;
    }

    const char *cFilterSet = [filterSet UTF8String];

    CContentBlockingRules *rules = convert_rules_to_content_blocking_c(cFilterSet);

    if (!rules || !rules->rules_json) {
        return nil;
    }

    NSString *rulesJSON = [NSString stringWithUTF8String:rules->rules_json];
    BOOL truncated = rules->truncated ? YES : NO;

    [self freeContentBlockingRules:rules];

    return [[ContentBlockerResult alloc] initWithJSON:rulesJSON truncated:truncated];
}

+ (void)freeContentBlockingRules:(void*)rules {
    if (rules) {
        free_content_blocking_rules(rules);
    }
}

@end
