//
//  MenuDataSource.h
//  SundaysOcScrollMenu
//
//  Created by Yan. on 2017/7/4.
//  Copyright © 2017年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SundaysOcScrollMenu.h"

@interface MenuDataSource : NSObject<YANObjectProtocol>
////小红标
@property (nonatomic, assign) UIViewContentMode itemBadgeAlign;
@property (nonatomic, assign) SQBadgeStyle itemBadgeStyle;
@property (nonatomic, assign) CGFloat itemBadgeCornerRadius;
@property (nonatomic, assign) CGFloat itemBadgeDianCornerRadius;
@property (nonatomic, strong) UIFont *itemBadgeFont;
@property (nonatomic, copy) NSString *itemBadgeNum;
@property (nonatomic, strong) UIColor *itemBadgeBGColor;
@property (nonatomic, strong) UIColor *itemBadgeTextColor;
@property (nonatomic, assign) CGFloat offsetHMargin;
@property (nonatomic, assign) CGFloat offsetVMargin;
/**
 *  显示文本
 */
@property (nonatomic, copy) NSString *itemDescription;
/**
 *  显示图片，可以为NSURL,NSString,UIImage三种格式
 */
@property (nonatomic, strong) id itemImage;
/**
 *  占位图片
 */
@property (nonatomic, strong) UIImage *itemPlaceholder;

@end
