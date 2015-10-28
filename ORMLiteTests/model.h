//
//  model.h
//  ORMLite
//
//  Created by jasenhuang on 15/10/26.
//  Copyright © 2015年 tencent. All rights reserved.
//

#import <ORMLite/ORMLite.h>
#import "ORMLite.h"

@interface model : ORMObject
ORMDataBase(pub)
ORMTable(model)
@property(nonatomic,assign, primary) NSInteger itemId;
@property(nonatomic,copy, datafield) NSString* name;
@property(nonatomic,copy, datafield) NSString* title;
@end
