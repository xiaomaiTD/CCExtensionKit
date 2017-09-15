//
//  CCMediator.m
//  CCLocalLibrary
//
//  Created by Elwinfrederick on 14/09/2017.
//  Copyright © 2017 冯明庆. All rights reserved.
//

#import "CCMediator.h"

@implementation CCMediator

+ (id) ccPerform : (NSString *) sTarget
          action : (NSString *) sAction
      returnVale : (BOOL) isNeed
           value : (id (^)()) value {
    id m;
    if (value) m = value();
    Class ts = NSClassFromString(sTarget);
    SEL as = NSSelectorFromString(sAction);
    
    if (!ts || !as || ![ts respondsToSelector:as]) return nil;
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if (isNeed) return [ts performSelector:as withObject:m];
    else [ts performSelector:as withObject:m];
#pragma clang diagnostic pop
    return nil;
}

@end