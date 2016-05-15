//
//  IndicatorLable.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/14.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "IndicatorLable.h"

@interface IndicatorLable()
{
    NSString *titleStr;
    CGFloat titleSize;
    UIColor *titleColor;
    UIImageView *imageview;
    CAShapeLayer *shapLayer;
}
@property (nonatomic, copy) void (^block)(id sender);
@end

@implementation IndicatorLable

- (CGSize)indicatorSize {
    if (CGSizeEqualToSize(_indicatorSize, CGSizeZero)) {
        _indicatorSize = CGSizeMake(6, 13);
    }
    return _indicatorSize;
}

- (UIColor *)indicatorColor {
    if (!_indicatorColor) {
        _indicatorColor = [UIColor colorWithWhite:0.46 alpha:1];
    }
    return _indicatorColor;
}

- (AlignmentEnum)alignment {
    if (!_indicatorAlign) {
        _indicatorAlign = RIGHT;
    }
    return _indicatorAlign;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)text {
    self = [super initWithFrame:frame];
    if (self) {
        titleStr = text;
        [self setUpView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString*)text
                    titleSize:(CGFloat)s
                   titleColor:(UIColor*)c {
    self = [super initWithFrame:frame];
    if (self) {
        titleStr    = text;
        titleSize   = s;
        titleColor  = c;
        [self setUpView];
    }
    return self;
}

- (void)setIndicatorImage:(UIImage *)image indicatorSize:(CGSize)size {
    _indicatorImage = image;
    _indicatorSize  = size;
}

- (void)setIndicatorColor:(UIColor *)color indicatorSize:(CGSize)size {
    _indicatorColor = color;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        _indicatorSize = CGSizeMake(6, 13);
    }else {
        _indicatorSize = size;
    }
}

- (void)setTitleAlign:(NSTextAlignment)align1 indicatorAlign:(AlignmentEnum)align2 {
    _title.textAlignment = align1;
    _indicatorAlign = align2;
}

- (void)setUpView {
    self.clipsToBounds = YES;
    _title = [[UILabel alloc] init];
    _title.text = titleStr;
    _title.textColor = titleColor;
    _title.font = [UIFont systemFontOfSize:titleSize];
    _title.textAlignment = NSTextAlignmentLeft;//必须
    [self addSubview:_title];
}


/**
 *  封装block点击事件
 *  ///@property (nonatomic, copy) void (^block)(id sender);
 *  @param block
 */
- (void)addActionBlock:(void (^)(id sender))block {
    _block = block;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(invoke:)];
    [self addGestureRecognizer:tap];
}
- (void)invoke:(id)sender {
    if (_block) _block(sender);
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    XunLog(@"willMoveToSuperview");
}

- (CGSize)sizeThatFits:(CGSize)size {
    //
    CGSize size1 = [self calculateTitleSizeWithString:titleStr];
    CGSize sumSize = CGSizeMake(size1.width +_indicatorSize.width +8, size1.height +_indicatorSize.height);
    return sumSize;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    XunLog(@"layoutSubviews");
    CGFloat y = self.bounds.size.height/2;
    CGFloat x_center = self.bounds.size.width/2 -self.indicatorSize.width/2-4/2;
    if (self.indicatorImage) {
        [imageview removeFromSuperview];
        //图片指示器
        imageview = [[UIImageView alloc] initWithImage:_indicatorImage];
        if (self.indicatorAlign == CENTER && _title.textAlignment == NSTextAlignmentCenter) {
            CGSize strSize = [self calculateTitleSizeWithString:titleStr];
            imageview.frame = CGRectMake(x_center-strSize.width/2, y-self.indicatorSize.height/2, self.indicatorSize.width, self.indicatorSize.height);
        }else {
            imageview.frame = CGRectMake(0, y-self.indicatorSize.height/2, self.indicatorSize.width, self.indicatorSize.height);
        }
        [self addSubview:imageview];
        CGRect frame = self.bounds;
        if (self.indicatorAlign == CENTER && _title.textAlignment == NSTextAlignmentCenter) {
            frame.origin.x = self.indicatorSize.width/2+4/2;
        }
        if (_title.textAlignment == NSTextAlignmentLeft) {
            frame.origin.x = self.indicatorSize.width+8;
        }
        _title.frame = frame;
    }
    else if (self.indicatorAlign == LEFT && !self.indicatorImage) {
        [shapLayer removeFromSuperlayer];
        //左指示器
        CGRect frame = self.bounds;
        if (_title.textAlignment == NSTextAlignmentLeft) {
            frame.origin.x = self.indicatorSize.width+8;
        }
        _title.frame = frame;
        shapLayer = [self createLeftIndicatorWithPosition:CGPointMake(self.indicatorSize.width/2, y)];
        [self.layer addSublayer:shapLayer];
    }
    else {
        [shapLayer removeFromSuperlayer];
        //右指示器
        CGRect frame = self.bounds;
        if (_title.textAlignment == NSTextAlignmentRight) {
            frame.size.width -= (self.indicatorSize.width+8);
        }
        _title.frame = frame;
        shapLayer = [self createIndicatorWithPosition:CGPointMake(self.bounds.size.width-self.indicatorSize.width/2-1.5, y) anchorPoint:CGPointMake(0.5, 0.5)];
        [self.layer addSublayer:shapLayer];
    }
}

//计算String的宽度
- (CGSize)calculateTitleSizeWithString:(NSString *)string {
    NSDictionary *dic = @{NSFontAttributeName :self.title.font};
    CGSize size = [string boundingRectWithSize:CGSizeMake(320, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return CGSizeMake(ceilf(size.width)+2, size.height);
}

- (CAShapeLayer *)createIndicatorWithPosition:(CGPoint)position anchorPoint:(CGPoint)anchor {
    CAShapeLayer *layer = [CAShapeLayer new];

    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0,0)];
    [path addLineToPoint:CGPointMake(self.indicatorSize.width, self.indicatorSize.height/2)];
    [path addLineToPoint:CGPointMake(0, self.indicatorSize.height)];
    
    layer.path = path.CGPath;
    if (self.indicatorSize.height >= 15) {
        layer.lineWidth = 3;
    }else if (self.indicatorSize.height > 10 &&
              self.indicatorSize.height < 15) {
        layer.lineWidth = 2.5;
    }else {
        layer.lineWidth = 2;
    }
    layer.strokeColor = self.indicatorColor.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    
    layer.position = position;
    layer.anchorPoint = anchor;

    //layer.backgroundColor = [UIColor whiteColor].CGColor;
    return layer;
}
//leftIndicator
- (CAShapeLayer *)createLeftIndicatorWithPosition:(CGPoint)position {
    CAShapeLayer *layer = [CAShapeLayer new];
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0,0)];
    [path addLineToPoint:CGPointMake(0, self.indicatorSize.height)];
    
    layer.path = path.CGPath;
    layer.lineWidth   = self.indicatorSize.width;
    layer.strokeColor = self.indicatorColor.CGColor;
    layer.fillColor   = [UIColor clearColor].CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    
    layer.position = position;

    return layer;
}

@end
