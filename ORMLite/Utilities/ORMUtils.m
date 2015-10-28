//
//  ORMUtils.m
//  ORMLite
//
//  Created by jasenhuang on 15/10/26.
//  Copyright © 2015年 tencent. All rights reserved.
//

#import "ORMUtils.h"
#import <objc/runtime.h>

@implementation ORMUtils
+ (NSArray *)propertiesOfClass:(Class)classType {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(classType, &count);
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:count];
    for (unsigned int i = 0; i < count; ++i) {
        const char *property_name = property_getName(properties[i]);
        NSString *propertyName = [NSString stringWithCString:property_name encoding:NSUTF8StringEncoding];
        if (![propertyName isEqualToString:@"hash"] &&
            ![propertyName isEqualToString:@"superclass"] &&
            ![propertyName isEqualToString:@"description"] &&
            ![propertyName isEqualToString:@"debugDescription"]) {
            [result addObject:propertyName];
        }
    }
    free(properties);
    return result;
}
@end
