//
//  ORMObject.m
//  ORMLite
//
//  Created by jasenhuang on 15/10/16.
//  Copyright © 2015年 tencent. All rights reserved.
//

#import "ORMObject.h"
#import "ORMUtils.h"
#import <objc/runtime.h>

@interface ORMObject()
{
    NSMutableArray* _changes;
    NSArray* _propertynames;
}
@end

@implementation ORMObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

/**
 * init a object for database
 **/
- (instancetype)initForDB
{
    self = [super init];
    if (self) {
        _changes = [NSMutableArray array];
        _propertynames = [ORMUtils propertiesOfClass:[self class]];
        for (NSString *property in _propertynames) {
            [self addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:NULL];
        }
    }
    return self;
}
-(void)dealloc
{
    for (NSString *property in _propertynames) {
        [self removeObserver:self forKeyPath:property];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    if (![_changes containsObject:keyPath]) {
        [_changes addObject:keyPath];
    }
}
- (void)save
{
    /** save to database **/
    NSAssert(_changes, @"create");
    
    /** remove change fields **/
    [_changes removeAllObjects];
}
@end
