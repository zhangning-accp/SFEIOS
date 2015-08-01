//
//  sm_encyclopedia_material_type_entity.h
//  SuperiorFamilyEducationIOS
//
//  Created by zn-mac on 15/7/21.
//  Copyright © 2015年 zpf. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 资料类型实体
 @author:zn
 @datetime:2015-07-21
 */
@interface sm_encyclopedia_material_type_entity : NSObject

@property(nonnull) NSInteger *id;
@property(nonnull) NSInteger *parentId; //分类父id。如果id和parentId都为0表示是顶级目录
@property(nonnull) NSInteger *state;
@property(nonnull) NSString *name;

+(instancetype)builderObjectWithJson:(nonnull)jsonString;
@end

