//
//  BLLoader.m
//  Example
//
//  Created by Poonia on 13/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import "BLLoader.h"

#define ROUND_TIME 1.5
#define DEFAULT_LINE_WIDTH 10.0
#define DEFAULT_COLOR [UIColor orangeColor]

@interface BLLoader ()

@property (nonatomic, strong) CAShapeLayer *firstLayer;
@property (nonatomic, strong) CAShapeLayer *secondLayer;
@property (nonatomic, strong) CAAnimation *rotationAnimation;
@property (nonatomic) BOOL animating;

@end

@implementation BLLoader

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if(self) {
        [self initialSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self initialSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initialSetup];
    }
    return self;
}

#pragma mark - Initial Setup

- (void)initialSetup {
    self.firstLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.firstLayer];
    
    self.secondLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.secondLayer];
    
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    self.lineWidth = DEFAULT_LINE_WIDTH;
    self.color = DEFAULT_COLOR;
    
    self.firstLayer.fillColor = nil;
    self.secondLayer.fillColor = nil;
    
    [self updateAnimations];
}

#pragma mark - Layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height) / 2.0 - self.lineWidth / 2.0;
    
    UIBezierPath *firstPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI_4 endAngle:M_PI_4 clockwise:YES];
    UIBezierPath *secondPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:3*M_PI_4 endAngle:(5*M_PI_4) clockwise:YES];
    
    self.firstLayer.path = firstPath.CGPath;
    self.firstLayer.frame = self.bounds;
    
    self.secondLayer.path = secondPath.CGPath;
    self.secondLayer.frame = self.bounds;
}

#pragma mark -

- (void)setColor:(UIColor *)color{
    _color = color;
    self.firstLayer.strokeColor = color.CGColor;
    self.secondLayer.strokeColor = color.CGColor;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    self.firstLayer.lineWidth = _lineWidth;
    self.secondLayer.lineWidth = _lineWidth;
}

#pragma mark -

- (void)startAnimation {
    _animating = YES;
    [self.layer addAnimation:self.rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopAnimation {
    _animating = NO;
    [self.layer removeAnimationForKey:@"rotationAnimation"];
}

- (BOOL)isAnimating {
    return _animating;
}

#pragma mark -

- (void)updateAnimations {
    
    // Rotation
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.fromValue = @0;
    rotationAnimation.toValue = @(2*M_PI);
    rotationAnimation.duration = ROUND_TIME;
    rotationAnimation.repeatCount = INFINITY;
    self.rotationAnimation = rotationAnimation;
}

#pragma mark - Dealloc

- (void)dealloc {
    [self stopAnimation];
    [self.firstLayer removeFromSuperlayer];
    self.firstLayer = nil;
    [self.secondLayer removeFromSuperlayer];
    self.secondLayer = nil;
    self.rotationAnimation = nil;
    self.color = nil;
}

@end
