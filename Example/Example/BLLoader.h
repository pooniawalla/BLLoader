//
//  BLLoader.h
//  Example
//
//  Created by Poonia on 13/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLLoader : UIView

/**
 * color of the loader
 */
@property (nonatomic, strong) UIColor *color;

/**
 * lineWidth of the stroke
 */
@property (nonatomic) CGFloat lineWidth;

- (void)startAnimation;
- (void)stopAnimation;
- (BOOL)isAnimating;

@end
