//
//  CCProxyDealer.m
//  CCLocalLibrary
//
//  Created by Elwinfrederick on 15/09/2017.
//  Copyright © 2017 冯明庆. All rights reserved.
//

#import "CCProxyDealer.h"

#ifdef _CC_PROXY_DELER_PROTOCOL_TEST_EXAMPLE_
#import <objc/runtime.h>

@interface CCProxyDealer ()

@property (nonatomic , strong) NSMutableDictionary *dMapMethods ;

@end

@implementation CCProxyDealer

+ (instancetype) common {
    return [[self alloc] init];
}
+ (instancetype) common : (NSArray <id> *) arrayTarget {
    return [[self common] cc_regist_methods:arrayTarget];
}

- (instancetype) cc_regist_methods : (NSArray <id> *) arrayTarget {
    for (id t in arrayTarget) {
        unsigned int iMethods = 0; // methods count
        // get target methods list
        Method *methodList = class_copyMethodList([t class], &iMethods);
        
        for (int i = 0; i < iMethods; i ++) {
            // get names of methods and stored in dictionary
            Method tMethod = methodList[i];
            SEL tSel = method_getName(tMethod);
            const char *tMethodName = sel_getName(tSel);
            [self.dMapMethods setObject:t
                                  forKey:[NSString stringWithUTF8String:tMethodName]];
        }
        free(methodList);
    }
    return self;
}

#pragma mark - ----
// override NSProxy methods

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = invocation.selector; // find current selector that selected
    NSString *sMethodName = NSStringFromSelector(sel); // get sel 's method name
    id target = self.dMapMethods[sMethodName]; // find target in dictionary
    
    // check target
    if (target && [target respondsToSelector:sel]) [invocation invokeWithTarget:target];
    else [super forwardInvocation:invocation];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSString *sMethodName = NSStringFromSelector(sel);
    id target = self.dMapMethods[sMethodName];
    
    if (target && [target respondsToSelector:sel]) return [target methodSignatureForSelector:sel];
    else return [super methodSignatureForSelector:sel];
}

- (NSMutableDictionary *)dMapMethods {
    if (_dMapMethods) return _dMapMethods;
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    _dMapMethods = d;
    return _dMapMethods;
}

@end

#endif
