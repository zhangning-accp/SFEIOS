#ifndef sfe_define_h
#define sfe_define_h


#import <UIKit/UIKit.h>
#import "sfe_file.h"
#import "sfe_image.h"
#import "sfe_screen.h"


/// 默认背景颜色
#define DEFAULTBACKCOLOR \
[UIColor colorWithRed:1.0 green:0.988 blue:0.976 alpha:1.0]
/// 自定义颜色
#define UICOLORRGBA(r,g,b,a) \
[UIColor colorWithRed:r green:g blue:b alpha:a]
/// 设置背景色图片
#define UICOLORIMAGE(imagePath) \
[UIColor colorWithPatternImage:[sfe_image imageBy:imagePath]]


/// 默认字体名称-加粗
#define DEFAULTFONTNAMEBOLD @"HelveticaNeue-Bold"
/// 默认字体名称
#define DEFAULTFONTNAME @"AppleGothic"


#endif
