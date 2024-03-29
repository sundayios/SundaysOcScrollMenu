/***********************************************************************

                        ::
                        :;J7, :,                        ::;7:
                        ,ivYi, ,                       ;LLLFS:
                        :iv7Yi                       :7ri;j5PL
                       ,:ivYLvr                    ,ivrrirrY2X,
                       :;r@Wwz.7r:                :ivukexianli.
                      :iL7::,:::iiirii:ii;::::,,irvF7rvvLujL7ur
                     ri::,:,::i:iiiiiii:i:irrv177JX7rYXqZEkvv17
                  ;i:, , ::::iirrririi:i:::iiir2XXvii;L8OGJr71i
                :,, ,,:   ,::ir@mingyi.irii:i:::j1jri7ZBOS7ivv,
                  ,::,    ::rv77iiiriii:iii:i::,rvLqshuhao.Li,
               ,,      ,, ,:ir7ir::,:::i;ir:::i:i::rSGGYri712:
             :::  ,v7r:: ::rrv77:, ,, ,:i7rrii:::::, ir7ri7Lri
            ,     2OBBOi,iiir;r::        ,irriiii::,, ,iv7Luur:
          ,,     i78MBBi,:,:::,:,  :7FSL: ,iriii:::i::,,:rLqXv::
          :      iuMMP: :,:::,:ii;2GY7OBB0viiii:i:iii:i:::iJqL;::
         ,     ::::i   ,,,,, ::LuBBu BBBBBErii:i:i:i:i:i:i:r77ii
        ,       :       , ,,:::rruBZ1MBBqi, :,,,:::,::::::iiriri:
       ,               ,,,,::::i:  @arqiao.       ,:,, ,:::ii;i7:
      :,       rjujLYLi   ,,:::::,:::::::::,,   ,:i,:,,,,,::i:iii
      ::      BBBBBBBBB0,    ,,::: , ,:::::: ,      ,,,, ,,:::::::
      i,  ,  ,8BMMBBBBBBi     ,,:,,     ,,, , ,   , , , :,::ii::i::
      :      iZMOMOMBBM2::::::::::,,,,     ,,,,,,:,,,::::i:irr:i:::,
      i   ,,:;u0MBMOG1L:::i::::::  ,,,::,   ,,, ::::::i:i:iirii:i:i:
      :    ,iuUuuXUkFu7i:iii:i:::, :,:,: ::::::::i:i:::::iirr7iiri::
      :     :rk@Yizero.i:::::, ,:ii:::::::i:::::i::,::::iirrriiiri::,
       :      5BMBBBBBBSr:,::rv2kuii:::iii::,:i:,, , ,,:,:i@petermu.,
            , :r50EZ8MBBBBGOBBBZP7::::i::,:::::,: :,:,::i;rrririiii::
                :jujYY7LS0ujJL7r::,::i::,::::::::::::::iirirrrrrrr:ii:
             ,:  :@kevensun.:,:,,,::::i:i:::::,,::::::iir;ii;7v77;ii;i,
             ,,,     ,,:,::::::i:iiiii:i::::,, ::::iiiir@xingjief.r;7:i,
          , , ,,,:,,::::::::iiiiiiiiii:,:,:::::::::iiir;ri7vL77rrirri::
           :,, , ::::::::i:::i:::i:i::,,,,,:,::i:i:::iir;@Secbone.ii:::

                               --    SundaysOcScrollMenu  --
                               Created by Yan. on 2017/8/28.
                               Copyright © 2017年 Yan. All rights reserved.
****************************************************************************/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
UIViewContentModeTop,
UIViewContentModeBottom,
UIViewContentModeLeft,
UIViewContentModeRight,
UIViewContentModeTopLeft,
UIViewContentModeTopRight,
UIViewContentModeBottomLeft,
UIViewContentModeBottomRight
 ***/
/** 数据模型协议 */

typedef NS_ENUM(NSUInteger, SQBadgeStyle) {
    SQBadgeStyleNone,
    SQBadgeStyleDian,
    SQBadgeStyleText,
};

@protocol YANObjectProtocol <NSObject>
//小红标
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



/** 菜单单元格 */
@interface SDOcMenuItem : UICollectionViewCell

/**
 *  图片的尺寸，默认是(40,40)
 */
@property (nonatomic, assign) CGSize iconSize  UI_APPEARANCE_SELECTOR ;
/**
 *  图片与文本的距离，默认是 10
 */
@property (nonatomic, assign) CGFloat space UI_APPEARANCE_SELECTOR;
/**
 *  图片的圆角率，默认是20
 */
@property (nonatomic, assign) CGFloat iconCornerRadius UI_APPEARANCE_SELECTOR;
/**
 *  文本的字体颜色，默认是darkTextColor
 */
@property (nonatomic, strong) UIColor *textColor UI_APPEARANCE_SELECTOR ;
/**
 *  文本的字体大小，默认是14号系统字体
 */
@property (nonatomic, strong) UIFont *textFont UI_APPEARANCE_SELECTOR;

@property (nonatomic, assign) UIViewContentMode badgeAlign;
@property (nonatomic, assign) CGFloat badgeCornerRadius;
@property (nonatomic, assign) CGFloat badgeDianCornerRadius;
@property (nonatomic, strong) UIFont *badgeFont;
@property (nonatomic, strong) UIColor *badgeBGcolor;
@property (nonatomic, strong) UIColor *badgeTextcolor;
@property (nonatomic, assign) SQBadgeStyle badgeStyle;
@property (nonatomic, assign) CGFloat offsetHMargin;
@property (nonatomic, assign) CGFloat offsetVMargin;
@end


@class SundaysOcScrollMenu;

/** 代理协议 */
@protocol SundaysOcScrollMenuDelegate <NSObject>
@optional
/**
 单元格尺寸，默认是(40,70)

 @param menu 菜单
 @return CGSize
 */
- (CGSize)itemSizeOfScrollMenu:(SundaysOcScrollMenu *)menu;
/**
 分区的页眉，默认不显示

 @param menu 菜单
 @param section 分区
 @return UIView
 */
- (UIView *)scrollMenu:(SundaysOcScrollMenu *)menu headerInSection:(NSUInteger)section;
/**
 页眉的高度，默认20

 @param menu 菜单
 @return CGFloat
 */
- (CGFloat)heightOfHeaderInScrollMenu:(SundaysOcScrollMenu *)menu;
/**
 分页器的高度，默认15

 @param menu 菜单
 @return CGFloat
 */
- (CGFloat)heightOfPageControlInScrollMenu:(SundaysOcScrollMenu *)menu;
/**
 当单元格数量改变时，是否自动更新Frame以适应。默认是NO

 @return BOOL
 */
- (BOOL)shouldAutomaticUpdateFrameInScrollMenu:(SundaysOcScrollMenu *)menu;
/**
 单元格点击回调

 @param menu 菜单
 @param indexPath 索引
 */
- (void)scrollMenu:(SundaysOcScrollMenu *)menu didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end


/** 数据源协议 */
@protocol SundaysOcScrollMenuDataSource <NSObject>
/**
 每个分区单元格的数量

 @param menu 菜单
 @param section 分区
 @return NSUInteger
 */
- (NSUInteger)scrollMenu:(SundaysOcScrollMenu *)menu numberOfItemsInSection:(NSInteger)section;
/**
 分区的数量

 @param menu 菜单
 @return NSUInteger
 */
- (NSUInteger)numberOfSectionsInScrollMenu:(SundaysOcScrollMenu *)menu;
/**
 数据源

 @param scrollMenu 菜单
 @param indexPath 索引
 @return id<YANObjectProtocol>
 */
- (id<YANObjectProtocol>)scrollMenu:(SundaysOcScrollMenu *)scrollMenu objectAtIndexPath:(NSIndexPath *)indexPath;

@end



/** 滑动菜单 */
@interface SundaysOcScrollMenu : UIView
/**
 *  分页控制器当前分页的颜色，默认是 darkTextColor;
 */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;
/**
 *  分页控制器分页的颜色，默认是 groupTableViewBackgroundColor;
 */
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

@property (nonatomic, assign) BOOL pageIndicatorHiden;
/**
 初始化方法

 @param frame CGRect
 @param aDelegate id
 @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame  delegate:(id)aDelegate;
/**
 刷新
 */
- (void)reloadData;

#pragma mark - 禁用的初始化方法
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END


