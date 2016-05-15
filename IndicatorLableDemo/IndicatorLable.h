//
//  IndicatorLable.h
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/14.
//  Copyright © 2016年 xun. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  指示器位置 enum
 */
typedef enum {
    LEFT = 1,
    RIGHT,
    CENTER
}AlignmentEnum;

@interface IndicatorLable : UIView

/**
 *  指示器位置【左 右 中】默认右, 中 只对图片指示器有用，
 */
@property (nonatomic, assign) AlignmentEnum indicatorAlign;
/**
 *  color 与image只能选择一个
 */
@property (nonatomic, strong) UIColor *indicatorColor;
/**
 *  image 与color只能选择一个、优先级高
 *  只有于左、中，对右无效
 */
@property (nonatomic, strong) UIImage *indicatorImage;
/**
 *  <#Description#>
 */
@property (nonatomic, assign) CGSize  indicatorSize;
/**
 *  <#Description#>
 */
@property (nonatomic, strong) UILabel *title;

/**
 *  初始化方法
 *
 *  @param frame view的frame
 *  @param text  文字
 *  @param s     字体大小
 *  @param c     文字颜色
 *
 *  @return id
 */
- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString*)text
                    titleSize:(CGFloat)s
                   titleColor:(UIColor*)c;
/**
 *  设置图片指示器
 *
 *  @param image 指示器图片
 *  @param size  指示器大小
 */
- (void)setIndicatorImage:(UIImage *)image indicatorSize:(CGSize)size;
/**
 *  设置指示器
 *
 *  @param color 指示器颜色
 *  @param size  指示器大小
 */
- (void)setIndicatorColor:(UIColor *)color indicatorSize:(CGSize)size;
/**
 *  <#Description#>
 *
 *  @param align1 <#align1 description#>
 *  @param align2 <#align2 description#>
 */
- (void)setTitleAlign:(NSTextAlignment)align1 indicatorAlign:(AlignmentEnum)align2;
/**
 *  点击事件
 *
 *  @param block <#block description#>
 */
- (void)addActionBlock:(void (^)(id sender))block;

@end
