//
//  HZYRoundShowButton.h
//  HZYRoundShowButton
//
//  Created by Michael-Nine on 16/8/2.
//  Copyright © 2016年 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HZYRoundShowButtonDelegate <NSObject>
- (void)baseButtonDidTouched:(UIButton *)baseBtn widthOpened:(BOOL)isOppened;
@end

@interface HZYRoundShowButton : UIView
+ (instancetype)roundShowButton:(NSArray<UIButton *> *)buttons andRadius:(CGFloat)radius andSize:(CGSize)size andPosition:(CGPoint)center;

@property (weak, nonatomic) id<HZYRoundShowButtonDelegate> delegate;
@property (assign, nonatomic) CGFloat arcLength;//展开的弧长 默认M_PI
@property (assign, nonatomic) CGFloat startAngle;//起始角度 默认0
@property (assign, nonatomic) CGFloat timeInterval;//弹出按钮的动画间隔0.1
@property (assign, nonatomic) CGFloat durationPerButton;//单个按钮动画的长度0.25
@property (assign, nonatomic) CGFloat springVelocity;//弹出
@property (assign, nonatomic) CGFloat springWithDamping;
@property (assign, nonatomic) BOOL clockWise;//动画方向
@property (assign, nonatomic) BOOL roundButton;//是否圆形按钮, 若为圆形请确保初始化方法的size正确
@end

