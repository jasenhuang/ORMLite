//
//  ORMObject.h
//  ORMLite
//
//  Created by jasenhuang on 15/10/16.
//  Copyright © 2015年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ORMObject : NSObject
/**
 * init a object for database
 **/
- (instancetype)initForDB;

- (void)save;

@end
