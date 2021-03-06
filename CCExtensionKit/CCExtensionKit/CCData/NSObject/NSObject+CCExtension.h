//
//  NSObject+CCExtension.h
//  CCLocalLibrary
//
//  Created by 冯明庆 on 2017/4/20.
//  Copyright © 2017年 冯明庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CCExtension)

@property (nonatomic , class , copy , readonly) NSString * s_self;
@property (nonatomic , class , readonly) Class Self;

@property (nonatomic , copy , readonly) NSString * toString ;
@property (nonatomic , copy , readonly) NSString * getClass ;

@end

BOOL CC_IS_STRING_VALUED(__kindof NSString * string) ;
BOOL CC_IS_ARRAY_VALUED(__kindof NSArray * array) ;
BOOL CC_IS_DICTIONARY_VALUED(__kindof NSDictionary * dictionary) ;
BOOL CC_IS_DECIMAL_VALUED(__kindof NSDecimalNumber * decimal) ;
BOOL CC_IS_NULL(id object) ;

@interface NSObject (CCExtension_KVO)

/// a block way to manage KVO .
+ (instancetype) cc_common ;

/// default options : NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld ;
- (instancetype) cc_add_observer_for : (NSString *) s_key_path
                            observer : (void (^)(NSString * s_key_path , id object , NSDictionary * change , void * context)) block_observer ;
- (instancetype) cc_add_observer_for : (NSString *) s_key_path
                             options : (NSKeyValueObservingOptions) options
                            observer : (void (^)(NSString * s_key_path , id object , NSDictionary * change , void * context)) block_observer ;
- (instancetype) cc_add_observer_for : (NSString *) s_key_path
                             options : (NSKeyValueObservingOptions) options
                             context : (void *) context
                            observer : (void (^)(NSString * s_key_path , id object , NSDictionary * change , void * context)) block_observer ;

- (void) cc_remove_observer_for : (NSString *) s_key_path ;
- (void) cc_remove_all_observers_and_destory ;

@end
