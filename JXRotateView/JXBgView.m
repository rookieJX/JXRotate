//
//  JXBgView.m
//  JXRotateView
//
//  Created by yuezuo on 16/5/9.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "JXBgView.h"

@implementation JXBgView

- (void)awakeFromNib {
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // 新建复制层
    CAReplicatorLayer * repL = [CAReplicatorLayer layer];
    // 复制图层的尺寸
    repL.frame = rect;
    // 将复制层添加到控制器图层上
    [self.layer addSublayer:repL];
    
    // 新建图层
    CALayer * rotateLayer = [CALayer layer];
    // 将新建图层初始值尺寸设置Wie0
    rotateLayer.transform = CATransform3DMakeScale(0, 0, 0);
    rotateLayer.bounds = CGRectMake(0, 0, 10, 10);
    rotateLayer.cornerRadius = 5;
    rotateLayer.position = CGPointMake(rect.size.width/2.0, 15);
    rotateLayer.backgroundColor = self.bgColor.CGColor;
    [repL addSublayer:rotateLayer];
    
    // 设置缩放动画
    CABasicAnimation * base = [CABasicAnimation animation];
    // 缩放路劲
    base.keyPath = @"transform.scale";
    // 缩放尺寸从1到0.1
    base.fromValue = @1;
    base.toValue = @0;
    // 缩放持续时间
    base.duration = self.bgTime;
    base.repeatCount = MAXFLOAT;
    [rotateLayer addAnimation:base forKey:nil];
    
    // 设置子层个数
    repL.instanceCount = self.bgCount;
    // 每个子层需要旋转的角度
    CGFloat angle = M_PI * 2 / self.bgCount;
    // 绕Z轴旋转
    repL.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    // 每个子层需要显示延迟的时间
    repL.instanceDelay = self.bgTime / self.bgCount;
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    [self setNeedsDisplay];
}

- (void)setBgCount:(NSInteger)bgCount {
    _bgCount = bgCount;
    [self setNeedsDisplay];
}

- (void)setBgTime:(CGFloat)bgTime {
    _bgTime = bgTime;
    [self setNeedsDisplay];
}
@end
