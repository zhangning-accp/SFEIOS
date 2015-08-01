#import "sfe_define.h"



/**
 功能：JSon操作类
 说明：对JSon文件的常用操作封装
 时间：2015-07-17
 */
@interface sfe_json : NSObject

/**
 功能：
    读取JSON文件数据，并返回数据字典
 参数说明：
    jsonString：JSON格式字符串
 返回值：
    JSON数据字典
 时间：2015-07-17
 */
- (nullable NSDictionary *)getJsonValue:(nonnull NSString *)jsonString;

@end
