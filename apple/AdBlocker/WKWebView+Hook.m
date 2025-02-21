#import <Foundation/Foundation.h>
#import "WKWebView+Hook.h"
#import <objc/runtime.h>

@implementation WKWebView (Hook)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // NSLog(@"[WKWebView+Hook] Swizzling handlesURLScheme: method");
        Method origin = class_getClassMethod(self, @selector(handlesURLScheme:));
        Method hook = class_getClassMethod(self, @selector(cdz_handlesURLScheme:));
        method_exchangeImplementations(origin, hook);
    });
}

+ (BOOL)cdz_handlesURLScheme:(NSString *)urlScheme {
    // NSLog(@"[WKWebView+Hook] cdz_handlesURLScheme called with scheme: %@", urlScheme);
    if ([urlScheme isEqualToString:@"http"] || [urlScheme isEqualToString:@"https"]) {
        // NSLog(@"[WKWebView+Hook] Returning NO for scheme: %@", urlScheme);
        return NO;
    }
    BOOL result = [self cdz_handlesURLScheme:urlScheme];
    // NSLog(@"[WKWebView+Hook] Returning original result: %d for scheme: %@", result, urlScheme);
    return result;
}

@end
