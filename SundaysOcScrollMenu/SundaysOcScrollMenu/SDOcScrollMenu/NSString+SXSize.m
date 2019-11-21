//
//  NSString+SXSize.m
//  SundaysOcScrollMenu
//
//  Created by 曹亮亮 on 2019/11/7.
//  Copyright © 2019 Yan. All rights reserved.
//

#import "NSString+SXSize.h"


@implementation NSString (SXSize)
//用对象的方法计算文本的大小
- (CGSize)sz_sizeWithFont:(UIFont*)font andMaxSize:(CGSize)size {
       //特殊的格式要求都写在属性字典中
      NSDictionary*attrs =@{NSFontAttributeName: font};
      //返回一个矩形，大小等于文本绘制完占据的宽和高。
      return  [self  boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (CGSize)sz_sizeWithString:(NSString*)str andFont:(UIFont*)font andMaxSize:(CGSize)size{
      NSDictionary*attrs =@{NSFontAttributeName: font};
      return  [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs  context:nil].size;
}
@end
