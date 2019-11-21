//
//  NSString+SXSize.h
//  SundaysOcScrollMenu
//
//  Created by 曹亮亮 on 2019/11/7.
//  Copyright © 2019 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SXSize)

//用对象的方法计算文本的大小
- (CGSize)sz_sizeWithFont:(UIFont*)font andMaxSize:(CGSize)size;


+ (CGSize)sz_sizeWithString:(NSString*)str andFont:(UIFont*)font andMaxSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
