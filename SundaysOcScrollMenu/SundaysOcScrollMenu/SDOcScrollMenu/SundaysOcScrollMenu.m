//
//  SundaysOcScrollMenu.m
//  SundaysOcScrollMenu
//
//  Created by Yan. on 2017/6/28.
//  Copyright © 2017年 Yan. All rights reserved.
//

#import "SundaysOcScrollMenu.h"
#import "YANFlowLayout.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
//#import "Masonry.h"
//#import "UIImageView+WebCache.h"
#import "NSString+SXSize.h"

//自动处理屏幕适配
#define kScale(P)                ((P) * ([UIScreen mainScreen].bounds.size.width / 375.f))


#pragma mark - SDOcMenuItem
/** 菜单单元格 */
@interface SDOcMenuItem ()
/**
 *  图片
 */
@property (nonatomic, strong) UIImageView *icon;
/**
 *  文本
 */
@property (nonatomic, strong) UILabel *label;
/**
 *小红点
 */
@property (nonatomic, strong) UILabel *badgelabel;

@end


@implementation SDOcMenuItem
#pragma mark - Life Cycle
+ (void)initialize{
    
    SDOcMenuItem *item = [self appearance];
    item.iconSize = CGSizeMake(kScale(40), kScale(40));
    item.iconCornerRadius = kScale(20);
    item.space = kScale(10);
    item.textColor = [UIColor darkTextColor];
    item.textFont = [UIFont systemFontOfSize:kScale(14)];
    
    item.badgeFont = [UIFont systemFontOfSize:10];
    item.badgeStyle = SQBadgeStyleNone;
    item.badgeAlign = UIViewContentModeTopRight;
    item.badgeCornerRadius = 7;
    item.badgeDianCornerRadius = 3;
    item.badgeTextcolor = UIColor.whiteColor;
    item.badgeBGcolor = UIColor.redColor;
    item.offsetHMargin = 0;
    item.offsetVMargin = 0;
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self prepareUI];
    }
    
    return self;
    
}
#pragma mark - Getter&Setter
- (void)setIconSize:(CGSize)iconSize{
    
    if (iconSize.width > 0 && iconSize.height > 0) {
        
        _iconSize = iconSize;
        
        [self layoutIfNeeded];
    }
    
}
- (void)setSpace:(CGFloat)space{
    
    if (space > 0) {
        
        _space = space;
        
        [self layoutIfNeeded];
    }
    
}
- (void)setIconCornerRadius:(CGFloat)iconCornerRadius{
    
    if (iconCornerRadius > 0) {
        
        _iconCornerRadius = iconCornerRadius;
        
        self.icon.layer.cornerRadius = iconCornerRadius;
        
    }
    
}
- (void)setTextColor:(UIColor *)textColor{
    
    _textColor = textColor;
    
    self.label.textColor = textColor;
    
}
- (void)setTextFont:(UIFont *)textFont{
    
    _textFont = textFont;
    
    self.label.font = textFont;
    
}
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    
    [super setBackgroundColor:backgroundColor];
    
    self.contentView.backgroundColor = backgroundColor;
    
}

- (void)setBadgeFont:(UIFont *)badgeFont {
    _badgeFont = badgeFont;
    self.badgelabel.font = badgeFont;
}

- (void)setBadgeAlign:(UIViewContentMode)badgeAlign {
    _badgeAlign = badgeAlign;
}

- (void)setBadgeStyle:(SQBadgeStyle)badgeStyle {
    _badgeStyle = badgeStyle;
}

- (void)setBadgeCornerRadius:(CGFloat)badgeCornerRadius {
    _badgeCornerRadius = badgeCornerRadius;
}

- (void)setBadgeDianCornerRadius:(CGFloat)badgeDianCornerRadius {
    _badgeDianCornerRadius = badgeDianCornerRadius;
}

- (void)setBadgeBGcolor:(UIColor *)badgeBGcolor {
    _badgeBGcolor = badgeBGcolor;
    self.badgelabel.backgroundColor = badgeBGcolor;
}

- (void)setBadgeTextcolor:(UIColor *)badgeTextcolor {
    _badgeTextcolor = badgeTextcolor;
    self.badgelabel.textColor = badgeTextcolor;
}

- (void)setOffsetVMargin:(CGFloat)offsetVMargin {
    _offsetVMargin = offsetVMargin;
}
- (void)setOffsetHMargin:(CGFloat)offsetHMargin {
    _offsetHMargin = offsetHMargin;
}


#pragma mark - UI
- (void)prepareUI{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.icon = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = self.iconCornerRadius;
        imageView;
    });
    
    self.label = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = self.textColor;
        label.font = self.textFont;
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label;
    });
    
    self.badgelabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = self.badgeTextcolor;
        label.backgroundColor = self.badgeBGcolor;
        label.font = self.badgeFont;
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = self.badgeCornerRadius;
        label;
    });
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.badgelabel];
    
}
- (void)layoutSubviews{

    [super layoutSubviews];

    
    //图片的约束
    [self.icon mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(self.iconSize);
        make.centerY.mas_equalTo(self.contentView).offset(- 2*self.space);
    }];

    //文本的约束
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.contentView);
        make.top.equalTo(self.icon.mas_bottom).offset(self.space);
    }];
    //红点约束
    NSString *badgeStr = self.badgelabel.text;
    CGFloat swith = [badgeStr sz_sizeWithFont:self.badgeFont andMaxSize:CGSizeMake(30, 25)].width + 4;
    if (self.badgeStyle == SQBadgeStyleDian) {
        self.badgelabel.layer.cornerRadius = self.badgeDianCornerRadius;
        self.badgelabel.text = nil;
    }else if (self.badgeStyle == SQBadgeStyleText){
        self.badgelabel.layer.cornerRadius = self.badgeCornerRadius;
    }else{
        self.badgelabel.layer.cornerRadius = 0;
    }
    switch (self.badgeAlign) {
        case UIViewContentModeTop:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_centerX).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(self.offsetVMargin);
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_centerX).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_centerX).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
        case UIViewContentModeLeft:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_centerY).offset(self.offsetVMargin);
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_centerY).offset(self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_centerY).offset(self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
        case UIViewContentModeBottom:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_centerX).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_centerX).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_centerX).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
        case UIViewContentModeRight:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_centerY).offset(self.offsetVMargin);
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_centerY).offset(self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_centerY).offset(self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
        case UIViewContentModeTopLeft:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(self.offsetVMargin);
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
        case UIViewContentModeTopRight:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);;
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(-self.offsetVMargin);;
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(-self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(-self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
        case UIViewContentModeBottomLeft:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_left).offset(self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
        case UIViewContentModeBottomRight:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_bottom).offset(-self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
        case UIViewContentModeCenter:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.center.mas_equalTo(self.icon.center).centerOffset(CGPointMake(self.offsetHMargin, self.offsetVMargin));
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.center.mas_equalTo(self.icon.center).centerOffset(CGPointMake(self.offsetHMargin, self.offsetVMargin));
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.center.mas_equalTo(self.icon.center).centerOffset(CGPointMake(self.offsetHMargin, self.offsetVMargin));
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;

        default:
        {
            if (self.badgeStyle == SQBadgeStyleDian) {
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);;
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(-self.offsetVMargin);;
                    make.width.height.mas_equalTo(self.badgeDianCornerRadius * 2);
                }];
            }else if(self.badgeStyle == SQBadgeStyleText){
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(-self.offsetVMargin);
                    if (swith > self.badgeCornerRadius * 2) {
                        make.width.mas_equalTo(swith);
                    }else{
                        make.width.mas_equalTo(self.badgeCornerRadius * 2);
                    }
                    make.height.mas_equalTo(self.badgeCornerRadius * 2);
                }];
            }else{
                [self.badgelabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(self.icon.mas_right).offset(-self.offsetHMargin);
                    make.centerY.mas_equalTo(self.icon.mas_top).offset(-self.offsetVMargin);
                    make.size.mas_equalTo(CGSizeZero);
                }];
            }
        }
            break;
    }

}
#pragma mark - Identifier
+ (NSString *)identifier{

    return NSStringFromClass([self class]);

}
#pragma mark - Customize
- (void)customizeItemWithObject:(id<YANObjectProtocol>)object{
    
    if (object == nil)  return;
    
    self.label.text = object.itemDescription;
    
    if ([object.itemImage isKindOfClass:[NSString class]]) {
        
        NSURL *url = [NSURL URLWithString:(NSString *)object.itemImage];
        [self.icon sd_setImageWithURL:url placeholderImage:object.itemPlaceholder];
        
    }else if ([object.itemImage isKindOfClass:[NSURL class]]){
        
        [self.icon sd_setImageWithURL:(NSURL *)object.itemImage placeholderImage:object.itemPlaceholder];
        
    }else if ([object.itemImage isKindOfClass:[UIImage class]]){
        
        self.icon.image = (UIImage *)object.itemImage;
    }
    
    self.badgelabel.text = object.itemBadgeNum;
    if (object.itemBadgeFont != nil) {
        [self setBadgeFont:object.itemBadgeFont];
    }else{
        [self setBadgeFont:[UIFont systemFontOfSize:10]];
    }
    if (object.itemBadgeTextColor != nil) {
        [self setBadgeTextcolor:object.itemBadgeTextColor];
    }
    if (object.itemBadgeBGColor != nil) {
        [self setBadgeBGcolor:object.itemBadgeBGColor];
    }
    
    if (object.itemBadgeStyle == SQBadgeStyleText) {
        if (object.itemBadgeCornerRadius > 0) {
            [self setBadgeCornerRadius:object.itemBadgeCornerRadius];
        }
    }else if (object.itemBadgeStyle == SQBadgeStyleDian) {
        if (object.itemBadgeDianCornerRadius > 0) {
            [self setBadgeDianCornerRadius:object.itemBadgeDianCornerRadius];
        }
    }
  
    [self setBadgeStyle:object.itemBadgeStyle];

    if (object.itemBadgeAlign) {
        [self setBadgeAlign:object.itemBadgeAlign];
    }else{
        [self setBadgeAlign:UIViewContentModeTopRight];
    }
}

@end

#pragma mark - SundaysOcScrollMenu
/** 滑动菜单 */
@interface SundaysOcScrollMenu ()<UICollectionViewDelegate,UICollectionViewDataSource>
/**
 *  视图
 */
@property (nonatomic, strong) UICollectionView *collectionView;
/**
 *  分页控制器
 */
@property (nonatomic, strong) UIPageControl *pageControl;
/**
 *  布局
 */
@property (nonatomic, strong) YANFlowLayout *flowLayout;
/**
 *  头
 */
@property (nonatomic, strong) UIView *header;
/**
 *  代理
 */
@property (nonatomic, weak) id<SundaysOcScrollMenuDelegate> delegate;
/**
 *  数据源
 */
@property (nonatomic, weak) id<SundaysOcScrollMenuDataSource> dataSource;
/**
 *  记录每个分区的位移量
 */
@property (nonatomic, strong) NSMutableArray<NSNumber *> *offsetArray;
/**
 *  原始尺寸
 */
@property (nonatomic, assign) CGRect originFrame;
/**
 *  页眉高度
 */
@property (nonatomic, assign) CGFloat headerHeight;
/**
 *  分页控制器高度
 */
@property (nonatomic, assign) CGFloat pageControlHeight;
/**
 *  单元格尺寸
 */
@property (nonatomic, assign) CGSize itemSize;
/**
 *  分页器总页数
 */
@property (nonatomic, assign) NSUInteger totalPages;
/**
 *  是否自动更新Frame
 */
@property (nonatomic, assign) BOOL automaticUpdateFrame;
@end

@implementation SundaysOcScrollMenu
#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame  delegate:(id)aDelegate{
    
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = aDelegate;
        self.dataSource = aDelegate;
        self.pageIndicatorHiden = false;
        self.originFrame = frame;
        
        [self prepareUI];
    }
    return self;
    
}
#pragma mark - UI
- (void)prepareUI{

    self.backgroundColor = [UIColor whiteColor];
    
    self.clipsToBounds = YES;
    
    self.flowLayout = ({
        YANFlowLayout *flowLayout = [[YANFlowLayout alloc] init];
        flowLayout.itemSize = self.itemSize;
        flowLayout;
    });
    

    self.collectionView = ({

        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.pagingEnabled = YES;

        [collectionView registerClass:[SDOcMenuItem class] forCellWithReuseIdentifier:[SDOcMenuItem identifier]];

        collectionView.delegate = self;
        collectionView.dataSource = self;

        collectionView;

    });

    self.pageControl = ({
        UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
        pageControl.currentPageIndicatorTintColor = [UIColor darkTextColor];
        pageControl.pageIndicatorTintColor =  [UIColor groupTableViewBackgroundColor];
        pageControl.numberOfPages = self.totalPages;
        pageControl.currentPage = 0;
        [pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
//        pageControl.hidden = self.pageIndicatorHiden;
        pageControl;
    });
    
    self.header = ({
        UIView *header = [[UIView alloc] init];
        header.backgroundColor = [UIColor whiteColor];
        header.clipsToBounds = YES;
        header;
    });

    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
    [self addSubview:self.header];
    
    [self layoutHeaderInSection:0];

}

- (void)setPageIndicatorHiden:(BOOL)pageIndicatorHiden {
    _pageIndicatorHiden = pageIndicatorHiden;
    self.pageControl.hidden = pageIndicatorHiden;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    //页眉
    [self updateHeaderConstraints];
    
    //分页器
    [self.pageControl mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self);
        make.height.mas_equalTo(self.pageControlHeight);
    }];
    //视图
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.pageControl.mas_top);
        make.top.mas_equalTo(self.header.mas_bottom);
    }];
}

/** 页眉约束 */
- (void)updateHeaderConstraints{
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollMenu:headerInSection:)]) {
        
        
        [self.header mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(self);
            make.height.mas_equalTo(self.headerHeight);
        }];
        
    }else{
        
        //页眉
        [self.header mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(self);
            make.height.mas_equalTo(0);
        }];
    }
}
/** 页眉设置 */
- (void)layoutHeaderInSection:(NSUInteger)section{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollMenu:headerInSection:)]) {
        
        [self.header.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        UIView* view =  [self.delegate scrollMenu:self headerInSection:section];
        
        view ? [self.header addSubview:view] : nil;
        
    }
    
}
#pragma mark - Getter&Setter
- (NSMutableArray<NSNumber *> *)offsetArray{
    if (_offsetArray == nil) {
        _offsetArray = [NSMutableArray array];
    }
    return _offsetArray;
}
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    
    [super setBackgroundColor:backgroundColor];
    
    self.collectionView.backgroundColor = backgroundColor;
    self.header.backgroundColor = backgroundColor;
    
}
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor{

    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;

    if (self.pageControl) {

        self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    }
}
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor{

    _pageIndicatorTintColor = pageIndicatorTintColor;

    if (self.pageControl) {

        self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
    }
}
/** 页眉高度 */
- (CGFloat)headerHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightOfHeaderInScrollMenu:)]) {
        
        return [self.delegate heightOfHeaderInScrollMenu:self];
    }
    
    return kScale(20);
}
/** 获取分页器高度 */
- (CGFloat)pageControlHeight{
 
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightOfPageControlInScrollMenu:)]) {
        
        return [self.delegate heightOfPageControlInScrollMenu:self];
    }
    
    return kScale(15);
}
/** 获取单元格尺寸 */
- (CGSize)itemSize{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(itemSizeOfScrollMenu:)]) {
        
        return  [self.delegate itemSizeOfScrollMenu:self];
        
    }
    
    return CGSizeMake(kScale(40), kScale(70));
    
}
/** 获取分页器总页数 */
- (NSUInteger)totalPages{
    
    //视图尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height - self.pageControlHeight - self.headerHeight;
    //行列最大的单元格数量
    NSInteger xCount = width/self.itemSize.width;
    NSInteger yCount = height/self.itemSize.height;
    
    //单页的数量
    NSInteger allCount = xCount * yCount;
    
    //清除上次位移数据
    [self.offsetArray removeAllObjects];
    
    //总页数
    NSUInteger page = 0;
    for (NSUInteger idx = 0; idx < [self getNumberOfSections]; idx ++) {
        NSUInteger count = [self getNumberOfItemsInSection:idx];
        NSUInteger pageRe = (count%allCount == 0) ?  (count/allCount) :  (count/allCount)+1;
        page += pageRe;
        
        //记录section的最大位移量
        [self.offsetArray addObject:@(page * width)];
    }
    
    return page;
}
/** 是否调节Frame以自适应 */
- (BOOL)automaticUpdateFrame{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(shouldAutomaticUpdateFrameInScrollMenu:)]) {
        
        return [self.delegate shouldAutomaticUpdateFrameInScrollMenu:self];
    }
    
    return NO;
    
}
/** 获取分区个数 */
- (NSUInteger)getNumberOfSections{
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsInScrollMenu:)]) {
        
        return [self.dataSource numberOfSectionsInScrollMenu:self];
    }
    
    return 1;
}
/** 获取单个分区的单元格数 */
- (NSUInteger)getNumberOfItemsInSection:(NSInteger)section{
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(scrollMenu:numberOfItemsInSection:)]) {
        
        return [self.dataSource scrollMenu:self numberOfItemsInSection:section];
    }
    
    return 0;
    
}
/** 获取多余的高度 */
- (CGFloat)getRedundantHeight{
    
    //视图尺寸
    CGFloat width = self.originFrame.size.width;
    CGFloat height = self.originFrame.size.height - self.pageControlHeight - self.headerHeight;
    //行列最大的单元格数量
    NSInteger xCount = width/self.itemSize.width;
    NSInteger yCount = height/self.itemSize.height;
    
    //单页的数量
    NSInteger allCount = xCount * yCount;
    
    //最小高度
    CGFloat lineNumber = 0;
    
    for (NSUInteger idx = 0; idx < [self getNumberOfSections]; idx ++) {
        NSUInteger count = [self getNumberOfItemsInSection:idx];
        
        if (count/allCount >= 1.f) {
            
            return 0;
            
        }else{
            
            NSInteger number = (count%xCount == 0) ?  (count/xCount) :  (count/xCount)+1;
            
            if (number > lineNumber) {
                lineNumber = number;
            }
        }
        
    }
    
    CGFloat redundantHeight = (yCount - lineNumber)*self.itemSize.height;
    
    return redundantHeight;
    
}
#pragma mark - PageCotrolTurn
- (void)pageTurn:(UIPageControl*)sender{

    CGSize viewSize = self.collectionView.frame.size;
    CGRect rect = CGRectMake(sender.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [self.collectionView scrollRectToVisible:rect animated:YES];
        
    [self changeHeaderInMenuContentOffset:rect.origin.x];

}
#pragma mark - ScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [self.pageControl setCurrentPage:offset.x / bounds.size.width];
    
    
    [self changeHeaderInMenuContentOffset:offset.x];
    
}
#pragma mark - Section
- (void)changeHeaderInMenuContentOffset:(CGFloat)offset{
    
    for (int idx = 0; idx < self.offsetArray.count; idx ++) {
        
        CGFloat currentOffset = offset + self.collectionView.frame.size.width;
        CGFloat theOffset = [self.offsetArray[idx] floatValue];
        
        
        if (currentOffset <= theOffset) {
            
            [self layoutHeaderInSection:idx];
            
            return;
        }
        
    }
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self getNumberOfItemsInSection:section];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return [self getNumberOfSections];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SDOcMenuItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:[SDOcMenuItem identifier] forIndexPath:indexPath];
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(scrollMenu:objectAtIndexPath:)]) {
        
        id<YANObjectProtocol> object = [self.dataSource scrollMenu:self objectAtIndexPath:indexPath];
        
        [item customizeItemWithObject:object];
    }
    
    return item;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollMenu:didSelectItemAtIndexPath:)]) {
        
        [self.delegate scrollMenu:self didSelectItemAtIndexPath:indexPath];
    }
    
}
#pragma mark - Public
- (void)updateFrame{
    
    CGRect frame = self.originFrame;
    
    frame.size.height -= [self getRedundantHeight];
    
    self.frame = frame;
    
}
- (void)reloadData{
    
    self.flowLayout.itemSize = self.itemSize;
    
    self.automaticUpdateFrame ? [self updateFrame]:nil;
    
    self.pageControl.hidden = (self.totalPages == 1 || self.pageIndicatorHiden == true);

    self.pageControl.numberOfPages = self.totalPages;
    
    [self.collectionView reloadData];
    
    [self changeHeaderInMenuContentOffset:self.pageControl.currentPage * self.collectionView.frame.size.width];
}


@end

