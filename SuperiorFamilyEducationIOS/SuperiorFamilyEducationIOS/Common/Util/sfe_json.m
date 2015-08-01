#import "sfe_json.h"



@interface sfe_json()

@end

@implementation sfe_json

/**
 功能：
    读取JSON文件数据，并返回数据字典
 参数说明：
    jsonString：JSON格式字符串
 返回值：
    JSON数据字典
 时间：2015-07-17
 */
- (nullable NSDictionary *)getJsonValue:(nonnull NSString *)jsonString {
    if ([sfe_file isBlankString:jsonString]) {
        return nil;
    }
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return dict;
}


@end
