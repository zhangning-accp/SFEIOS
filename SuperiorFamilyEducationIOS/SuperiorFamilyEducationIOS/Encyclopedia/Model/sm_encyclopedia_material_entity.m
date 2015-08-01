//
//  sm_encyclopedia_material_entity.m
//  SuperiorFamilyEducationIOS
//
//  Created by zn-mac on 15/7/22.
//  Copyright © 2015年 zpf. All rights reserved.
//

#import "sm_encyclopedia_material_entity.h"
#import "sfe_json.h"

@implementation sm_encyclopedia_material_entity
+(instancetype)builderObjectWithJson:(nonnull)jsonString {
    //构造资料类型尸体
    sm_encyclopedia_material_entity *entity = [[sm_encyclopedia_material_entity alloc]init];
    sfe_json *sfeJson = [[sfe_json alloc]init];
    NSDictionary *dictionary = [sfeJson getJsonValue:jsonString];
    entity.id = [[dictionary objectForKey:@"id"] intValue];
    entity.isDelete = [[dictionary objectForKey:@"isDelete"] intValue];//资料是否已删除
    entity.isPublic = [[dictionary objectForKey:@"isPublic"] intValue];//资料是否可分享
    entity.isReprint = [[dictionary objectForKey:@"isReprint"] intValue];//资料
    entity.uploadDate = [dictionary objectForKey:@"uploadDate"];//资料创建时间
    entity.isSystem = [[dictionary objectForKey:@"isSystem"] intValue];//是否是系统资料
    entity.filePath = [dictionary objectForKey:@"filePath"];//资料url路径
    entity.typeId = [[dictionary objectForKey:@"typeId"] intValue];//资料类型id
    entity.title = [dictionary objectForKey:@"title"];//资料标题
    entity.shortContent = [dictionary objectForKey:@"shortContent"];//资料简介
    entity.fullContent = [dictionary objectForKey:@"fullContent"];//资料完整内容
    entity.collect = [[dictionary objectForKey:@"collect"] intValue];//资料收藏数
    entity.praise = [[dictionary objectForKey:@"praise"] intValue];//资料点赞数
    entity.review = [[dictionary objectForKey:@"review"] intValue];//资料评论数
    entity.state = [[dictionary objectForKey:@"state"] intValue];
    return entity;
}
@end
