//
//  HZYRoundShowButton.m
//  HZYRoundShowButton
//
//  Created by Michael-Nine on 16/8/2.
//  Copyright © 2016年 Michael. All rights reserved.
//

#import "HZYRoundShowButton.h"

@interface HZYRoundShowButton ()
@property (strong, nonatomic) NSArray<UIButton *> *buttons;
@property (weak, nonatomic) UIButton *baseButton;
@property (assign, nonatomic) BOOL opened;
@property (assign, nonatomic) CGFloat radius;
@property (assign, nonatomic) CGSize baseBtnSize;

@end

@implementation HZYRoundShowButton
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configView];
    }
    return self;
}

+ (instancetype)roundShowButton:(NSArray<UIButton *> *)buttons andRadius:(CGFloat)radius andSize:(CGSize)size andPosition:(CGPoint)center{
    HZYRoundShowButton *rsb = [[self alloc]initWithFrame:CGRectMake(0, 0, (radius + size.width * 0.5) * 2, (radius + size.height * 0.5) * 2)];
    rsb.baseBtnSize = CGSizeMake(48, 48);
    rsb.center = center;
    rsb.buttons = buttons;
    rsb.radius = radius;
    rsb.arcLength = M_PI;
    rsb.startAngle = 0;
    rsb.timeInterval = 0.1;
    rsb.durationPerButton = 0.25;
    rsb.springWithDamping = 0.5;
    rsb.springVelocity = 1;
    return rsb;
}

- (void)configView{
    self.backgroundColor = [UIColor clearColor];
    
    UIButton *baseBtn = [UIButton new];
    baseBtn.center = self.center;
    [baseBtn setTitle:@"+" forState:UIControlStateNormal];
    baseBtn.backgroundColor = [UIColor blueColor];
    [baseBtn addTarget:self action:@selector(baseBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:baseBtn];
    self.baseButton = baseBtn;
}

- (void)baseBtnTouched:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseButtonDidTouched:widthOpened:)]) {
        [self.delegate baseButtonDidTouched:sender widthOpened:_opened];
    }
    
    CGFloat cornum = (_arcLength / (_buttons.count - 1));
    if (_opened) {
        [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [UIView animateWithDuration:_durationPerButton delay:idx * _timeInterval usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                obj.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                self.opened = NO;
            }];
        }];
    }else{
        [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [UIView animateWithDuration:_durationPerButton delay:idx * _timeInterval usingSpringWithDamping:_springWithDamping initialSpringVelocity:_springVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGFloat y = _clockWise ? sin(cornum * idx + _startAngle) : -sin(cornum * idx + _startAngle);
                obj.transform = CGAffineTransformMakeTranslation(cos(cornum * idx + _startAngle) * _radius, y * _radius);
            } completion:^(BOOL finished) {
                if (idx == self.buttons.count - 1) {
                    self.opened = YES;
                }
            }];
        }];
    }
}

- (void)setButtons:(NSArray<UIButton *> *)buttons{
    _buttons = buttons;
    for (UIButton *btn in _buttons) {
        btn.center = self.baseButton.center;
        [self insertSubview:btn belowSubview:_baseButton];
    }
}

- (void)setRoundButton:(BOOL)roundButton{
    if (roundButton) {
        for (UIButton *btn in _buttons) {
            btn.layer.cornerRadius = btn.bounds.size.width / 2;
            btn.layer.masksToBounds = YES;
        }
        self.baseButton.layer.cornerRadius = _baseBtnSize.width / 2;
        self.baseButton.layer.masksToBounds = YES;
    }
}

- (void)setBaseBtnSize:(CGSize)baseBtnSize{
    _baseBtnSize = baseBtnSize;
    _baseButton.bounds = CGRectMake(0, 0, baseBtnSize.width, baseBtnSize.height);
}
@end
