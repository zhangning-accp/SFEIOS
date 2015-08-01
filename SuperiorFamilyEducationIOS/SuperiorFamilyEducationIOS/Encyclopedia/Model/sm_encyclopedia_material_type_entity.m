//
//  sm_encyclopedia_material_type_entity.m
//  SuperiorFamilyEducationIOS
//
//  Created by zn-mac on 15/7/21.
//  Copyright © 2015年 zpf. All rights reserved.
//

#import "sm_encyclopedia_material_type_entity.h"
#import "sfe_json.h"
#import "sfe_image.h"

@implementation sm_encyclopedia_material_type_entity
+(instancetype)builderObjectWithJson:(nonnull)jsonString {
    //构造资料类型尸体
    sm_encyclopedia_material_type_entity *entity = [[sm_encyclopedia_material_type_entity alloc]init];
    sfe_json *sfeJson = [[sfe_json alloc]init];
    NSDictionary *dictionary = [sfeJson getJsonValue:jsonString];
    entity.id = [[dictionary objectForKey:@"id"] intValue];
    entity.name = [dictionary objectForKey:@"name"];
    entity.parentId = [[dictionary objectForKey:@"parentId"] intValue];
    entity.state = [[dictionary objectForKey:@"state"] intValue];
    
    return entity;
}
@end
