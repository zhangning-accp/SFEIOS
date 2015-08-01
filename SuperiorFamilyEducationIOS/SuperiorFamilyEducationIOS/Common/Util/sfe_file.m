#import "sfe_file.h"


@interface sfe_file()

@end

@implementation sfe_file

/**
 功能：
    获取文件在项目中的真实路径
 参数说明：
    path：文件在项目中虚拟路径
 返回值：
    文件在项目中的真实路径
 日期：2015-7-16
 */
+ (nullable NSString *)bundleFilePath:(nonnull NSString *)path {
    if ([sfe_file isBlankString:path]) {
        return nil;
    }
    
    // 获取路径中除了扩展名外的其余部分
    NSString *fileName = [path stringByDeletingPathExtension];
    if (fileName == nil || fileName.length == 0) {
        return nil;
    }
    // 获取路径中文件扩展名
    NSString *fileExt = [path pathExtension];
    if (fileExt == nil || fileExt.length == 0) {
        return nil;
    }
    
    // 获取文件在项目下得真实路径
    NSString *bundleFilePath = [[NSBundle mainBundle]pathForResource:fileName ofType:fileExt];
    
    return bundleFilePath;
}

/**
 功能：
    验证字符串是否为空
 参数说明：
    str：要验证的字符串
 返回值：
    验证结果[YES:为空,NO:非空]
 日期：2015-7-16
 */
+ (BOOL)isBlankString:(nonnull NSString *)str {
    if (str == nil || str == NULL) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;

}

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
+ (nullable NSMutableAttributedString *)divisionFontColor:(nonnull NSString *)string Spliter:(nonnull NSString *)spliter Colors:(nonnull NSArray *)colors {
    if ([sfe_file isBlankString:string] && [sfe_file isBlankString:spliter]) {
        return nil;
    }
    // 去掉首尾空格和换行符
    //    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSRange range = [string rangeOfString:spliter];
    if (range.location == NSNotFound) {
        return nil;
    }
    // 多属性字符串对象
    NSMutableAttributedString *attrib = [[NSMutableAttributedString alloc]initWithString:string];
    if (colors.count == 0) {
        return attrib;
    }
    [attrib addAttribute:NSForegroundColorAttributeName value:colors[0] range:NSMakeRange(0,range.location + 1)];
    if (colors.count == 1) {
        [attrib addAttribute:NSForegroundColorAttributeName value:colors[0] range:NSMakeRange(range.location + 1, string.length - range.location - 1)];
    } else {
        [attrib addAttribute:NSForegroundColorAttributeName value:colors[1] range:NSMakeRange(range.location + 1, string.length - range.location - 1)];
    }
    return attrib;
}

/**
 功能：
    验证文件扩展名
 参数说明：
    filename：文件名
 返回值：
    扩展名类型
 日期：2015-7-16
 */
+ (EnumFileType)verificationExtension:(nonnull NSString *)filename {
    if ([sfe_file isBlankString:filename]) {
        return EFT_Error;
    }
    NSString *extstr = [filename pathExtension];
    if (extstr == nil) {
        return EFT_Empty;
    } else if ([extstr compare:@"mp4" options:NSCaseInsensitiveSearch] ||
               [extstr compare:@"3gp" options:NSCaseInsensitiveSearch]) {
        return EFT_Video;
    } else if ([extstr compare:@"mp3" options:NSCaseInsensitiveSearch]) {
        return EFT_Audio;
    } else if ([extstr compare:@"jpg" options:NSCaseInsensitiveSearch] ||
               [extstr compare:@"png" options:NSCaseInsensitiveSearch]) {
        return EFT_Image;
    }
    
    return EFT_Empty;
}

@end
