//
//  LMProgressView.m
//  CBDFurniture
//
//  Created by cbd on 15/12/25.
//  Copyright © 2015年 com.CBD.furniture. All rights reserved.
//

#import "LMProgressView.h"

@interface LMProgressView ()

@property (nonatomic, strong) UILabel *progressLabel;

@property (nonatomic, strong) CAShapeLayer *progressBgLayer;

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation LMProgressView

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initConfig];
        [self layout];
    }
    return self;
}

- (void)layout {
    [self.layer addSublayer:self.progressBgLayer];
    [_progressBgLayer addSublayer:self.progressLayer];
    [self addSubview:self.progressLabel];
    _progressLabel.text = @"0%";
}

- (void)initConfig {
    _lineWidth = 10;
    _progressColor = [UIColor colorWithRed:135.0 / 255.0 green:141.0 / 255.0 blue:154.0 / 255.0 alpha:1.0];
    _x = 20;
    _y = CGRectGetHeight(self.frame) / 2;
}

#pragma mark - GET方法
- (UILabel *)progressLabel {
    if(!_progressLabel) {
        _progressLabel = [[UILabel alloc]init];
    }
    
    CGFloat progressLabelX = 10;
    CGFloat progressLabelH = 15;
    CGFloat progressLabelW = CGRectGetWidth(self.frame) - progressLabelX * 2;
    
    CGFloat progressLabelY = _y - _lineWidth / 2 - progressLabelH - 2;
    [_progressLabel setFrame:CGRectMake(progressLabelX, progressLabelY, progressLabelW, progressLabelH)];
    [_progressLabel setFont:[UIFont systemFontOfSize:13]];
    _progressLabel.textAlignment = NSTextAlignmentCenter;
    _progressLabel.textColor = [UIColor whiteColor];
    return _progressLabel;
}

- (CALayer *)progressBgLayer {
    if(!_progressBgLayer) {
        _progressBgLayer = [[CAShapeLayer alloc]init];
    }

    //create path
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGPoint beginP = CGPointMake(_x, _y);
    CGPoint endP = CGPointMake(CGRectGetWidth(self.frame) - _x, _y);
    [path moveToPoint:beginP];
    [path addLineToPoint:endP];
    _progressBgLayer.strokeColor = [UIColor colorWithRed:215.0 / 255.0 green:222.0 / 255.0 blue:233.0 / 255.0 alpha:1.0].CGColor;
    _progressBgLayer.fillColor = [UIColor clearColor].CGColor;
    _progressBgLayer.lineWidth = _lineWidth;
    _progressBgLayer.lineCap = kCALineCapRound;
    _progressBgLayer.path = path.CGPath;
    return _progressBgLayer;
}

- (CALayer *)progressLayer {
    if(!_progressLayer) {
        _progressLayer = [[CAShapeLayer alloc]init];
    }
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGPoint beginP = CGPointMake(_x, _y);
    CGPoint endP = CGPointMake(_x, _y);
    [path moveToPoint:beginP];
    [path addLineToPoint:endP];
    _progressLayer.strokeColor = _progressColor.CGColor;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.lineWidth = _lineWidth * 0.74;
    _progressLayer.lineCap = kCAFillRuleNonZero;
    _progressLayer.path = path.CGPath;
    return _progressLayer;
}

#pragma mark - SET方法
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    _progressLabel.text = [NSString stringWithFormat:@"%2.0f%%", progress * 100];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGPoint beginP = CGPointMake(_x, _y);
    CGPoint endP = CGPointMake(_x + (CGRectGetWidth(self.frame) - _x * 2) * progress, _y);
    [path moveToPoint:beginP];
    [path addLineToPoint:endP];
    _progressLayer.path = path.CGPath;
    _progressLayer.lineCap = kCALineCapRound;
}

- (void)setProgressColor:(UIColor *)progressColor {
    _progressColor = progressColor;
    _progressLayer.strokeColor = _progressColor.CGColor;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    _progressBgLayer.lineWidth = _lineWidth;
    _progressLayer.lineWidth = _lineWidth * 0.74;
}

- (void)setX:(CGFloat)x {
    _x = x;
    [self progressBgLayer];
    [self progressLayer];
}

- (void)setY:(CGFloat)y {
    _y = y;
    [self progressBgLayer];
    [self progressLayer];
    [self progressLabel];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    [_progressLabel setFont:_font];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    _progressLabel.textColor = _textColor;
}

@end
