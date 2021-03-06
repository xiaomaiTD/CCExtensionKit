//
//  WKWebView+CCExtension.h
//  CCLocalLibrary
//
//  Created by 冯明庆 on 2017/4/1.
//  Copyright © 2017年 冯明庆. All rights reserved.
//

#import <WebKit/WebKit.h>

@class  CCScriptMessageDelegate;

@interface WKWebView (CCExtension)

+ (instancetype) cc_common : (CGRect) frame;
+ (instancetype) cc_common : (CGRect) frame
             configuration : (WKWebViewConfiguration *) configuration ;
- (instancetype) cc_navigation_delegate : (id <WKNavigationDelegate>) delegate ;
- (instancetype) cc_script : (CCScriptMessageDelegate *) delegate
                       key : (NSString *) sKey;

/// Only "http://" && "https://" will be loaded online . // 只有 "http://" && "https://" 会被当做网址
/// others will be loading as HTML content . // 其它的会被当做 HTML 文本
- (instancetype) cc_loading : (NSString *) sLink
                 navigation : (void (^)(WKNavigation *navigation)) navigation ;
/// loading as links // 使用 网页加载
- (instancetype) cc_request : (NSString *) sLink
                 navigation : (void (^)(WKNavigation *navigation)) navigation ;
/// loading as HTML content // 使用 HTML 文本加载
- (instancetype) cc_content : (NSString *) content
                 navigation : (void (^)(WKNavigation *navigation)) navigation ;

@end

#pragma mark - -----

@interface CCScriptMessageDelegate : NSObject < WKScriptMessageHandler >

@property (nonatomic , assign) id < WKScriptMessageHandler > scriptDelegate;

- (instancetype) init:(id < WKScriptMessageHandler > ) scriptDelegate;

@end
