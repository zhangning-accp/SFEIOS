#import "sfe_define.h"


/**
 功能：文件类型枚举
 日期：2015-7-31
 */
typedef NS_ENUM (NSInteger, EnumFileType) {
    EFT_Empty = 0,
    EFT_Video = 1,
    EFT_Audio = 2,
    EFT_Image = 3,
    EFT_Error = -1
};

/**
 功能：文件类
 说明：对文件的常用操作封装
 作者：庄鹏飞
 日期：2015-7-16
 */
@interface sfe_file : NSObject

/**
 功能：
    获取文件在项目中的真实路径
 参数说明：
    path：文件在项目中虚拟路径
 返回值：
    文件在项目中的真实路径
 日期：2015-7-16
 */
+ (nullable NSString *)bundleFilePath:(nonnull NSString *)path;

/**
 功能：
    验证字符串是否为空
 参数说明：
    str：要验证的字符串
 返回值：
    验证结果[YES:为空,NO:非空]
 日期：2015-7-16
 */
+ (BOOL)isBlankString:(nonnull NSString *)str;

/**
 功能：
    根据分割符号，设置分隔符号左右字符串颜色
 参数说明：
    string：要操作的字符串
    spliter：分割字符数组
    colors：颜色数组[双色]
 返回值：
    双色字符串
 日期：2015-7-16
 */
+ (nullable NSMutableAttributedString *)divisionFontColor:(nonnull NSString *)string Spliter:(nonnull NSString *)spliter Colors:(nonnull NSArray *)colors;

/**
 功能：
    验证文件扩展名
 参数说明：
    filename：文件名
 返回值：
    扩展名类型
 日期：2015-7-16
 */
+ (EnumFileType)verificationExtension:(nonnull NSString *)filename;

@end
