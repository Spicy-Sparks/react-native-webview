// #import <Foundation/Foundation.h>
// #import "CustomSchemeHandler.h"
// #import "AdblockRust.h"
// #import <TargetConditionals.h>

// @implementation CustomSchemeHandler

// - (void)webView:(WKWebView *)webView startURLSchemeTask:(id<WKURLSchemeTask>)urlSchemeTask {
//     NSURL *url = urlSchemeTask.request.URL;
// //    NSLog(@"[CustomSchemeHandler] Intercepted request: %@", url.absoluteString);
    
//     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
// #if TARGET_OS_IOS
//         bool shouldBlock = create_engine_and_check_request_c([url.absoluteString UTF8String],
//                                                              [@"" UTF8String], // source_url
//                                                              "other"); // requestType
// #else
//         bool shouldBlock = false;
// #endif
//         dispatch_async(dispatch_get_main_queue(), ^{
//             if (shouldBlock) {
// //                NSLog(@"[CustomSchemeHandler] Blocking request: %@", url.absoluteString);
//                 NSError *error = [NSError errorWithDomain:@"CustomSchemeHandler" code:403 userInfo:@{NSLocalizedDescriptionKey: @"Blocked"}];
//                 [urlSchemeTask didFailWithError:error];
//             } else {
// //                NSLog(@"[CustomSchemeHandler] Allowing request: %@", url.absoluteString);
//                 NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:urlSchemeTask.request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                     if (error) {
//                         [urlSchemeTask didFailWithError:error];
//                     } else {
//                         if (response) {
//                             [urlSchemeTask didReceiveResponse:response];
//                         }
//                         if (data) {
//                             [urlSchemeTask didReceiveData:data];
//                         }
//                         [urlSchemeTask didFinish];
//                     }
//                 }];
//                 [task resume];
//             }
//         });
//     });
// }

// - (void)webView:(WKWebView *)webView stopURLSchemeTask:(id<WKURLSchemeTask>)urlSchemeTask {
// //    NSLog(@"[CustomSchemeHandler] Stopping request: %@", urlSchemeTask.request.URL.absoluteString);
// }

// @end
