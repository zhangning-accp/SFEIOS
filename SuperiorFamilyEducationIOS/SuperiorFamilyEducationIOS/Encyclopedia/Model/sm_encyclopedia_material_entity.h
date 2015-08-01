//
//  sm_encyclopedia_material_entity.h
//  SuperiorFamilyEducationIOS
//
//  Created by zn-mac on 15/7/22.
//  Copyright © 2015年 zpf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sm_encyclopedia_material_entity : NSObject

@property NSInteger id;//资料id
@property BOOL isDelete;//资料是否已删除
@property BOOL isPublic;//资料是否可分享
@property BOOL isReprint;//资料
@property(nonnull) NSDate *uploadDate;//资料创建时间
@property BOOL isSystem;//是否是系统资料
@property(nonnull) NSString *filePath;//资料url路径
@property NSInteger state;//资料状态
@property NSInteger typeId;//资料类型id
@property(nonnull) NSString *title;//资料标题
@property(nonnull) NSString *shortContent;//资料简介
@property(nonnull) NSString *fullContent;//资料完整内容
@property NSInteger collect;//资料收藏数
@property NSInteger praise;//资料点赞数
@property NSInteger review;//资料评论数

+(instancetype)builderObjectWithJson:(nonnull)jsonString;
@end
