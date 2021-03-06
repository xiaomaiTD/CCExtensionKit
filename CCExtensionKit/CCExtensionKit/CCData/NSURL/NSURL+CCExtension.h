//
//  NSURL+CCExtension.h
//  CCLocalLibrary
//
//  Created by Elwinfrederick on 06/09/2017.
//  Copyright © 2017 冯明庆. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef CC_URL_S
    #define CC_URL_S(_value_) [NSURL ccURL:_value_]
#endif
#ifndef CC_URL_L
    #define CC_URL_L(_value_) [NSURL ccLocal:_value_]
#endif

@interface NSURL (CCExtension)

+ (instancetype) cc_URL : (NSString *) sURL ;
+ (instancetype) cc_local : (NSString *) sURL ;

@end

@interface NSString (CCExtension_UrlEncode)

@property (nonatomic , readonly) NSURL *toWebURL ; // encode chinese character using origin // 使用原生转换为 在线 URL
@property (nonatomic , readonly) NSURL *toLocalURL ; // decode chinese character using origin // 使用原生转换为 本地 URL

@end
