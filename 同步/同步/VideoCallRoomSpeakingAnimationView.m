//
//  VideoCallRoomSpeakingAnimationView.m
//  同步
//
//  Created by 贾辰 on 18/7/8.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "VideoCallRoomSpeakingAnimationView.h"


static CGFloat const kAnimationDuraction = 3;
static NSInteger const kRecelicatorCount = 3;

@interface VideoCallRoomSpeakingAnimationView()
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) BOOL animationLayerState;
@property (strong, nonatomic) CAReplicatorLayer *layerReplicator;
@property (strong, nonatomic) CALayer *layerAnimation;
@end

@implementation VideoCallRoomSpeakingAnimationView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setBackgroundColor:[UIColor grayColor]];
        
        _animationLayerState = NO;
        
        self.layerReplicator = [CAReplicatorLayer layer];
        [_layerReplicator setInstanceCount:kRecelicatorCount];
        [_layerReplicator setInstanceDelay:kAnimationDuraction/kRecelicatorCount];
        [self.layer addSublayer:_layerReplicator];
        
        self.layerAnimation = [CALayer layer];
        [_layerAnimation setHidden:YES];
        [_layerAnimation setBorderWidth:1.5];
        [_layerReplicator addSublayer:_layerAnimation];
    }
    return self;
}

- (void)setLayerWidth:(CGFloat)width {
    
    _width = width;
}

- (void)setLayerColor:(UIColor *)color {
    
    [_layerAnimation setBorderColor:color.CGColor];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
//    [_layerReplicator setFrame:JORectNewOrigin(self.frame, CGPointMake(0., 0.))];
    [_layerReplicator setFrame:self.bounds];
    CGFloat x = (self.frame.size.width - _width)/2.;
    CGFloat y = (self.frame.size.height - _width)/2.;
    [_layerAnimation setFrame:CGRectMake(x, y, _width, _width)];
    [_layerAnimation setCornerRadius:_width/2.];
}

- (void)startAnimation {
    
    [self layoutIfNeeded];
    
    CGFloat maxScale = self.frame.size.width/_width;
    [_layerAnimation setHidden:NO];
    
//    //    [_layerAnimation joLayerAnimationWithKeyPath:kJOLayerKeyPathScale
//    //                                       fromValue:@(1)
//    //                                         toValue:@(maxScale)
//    //                                        duration:kAnimationDuraction
//    //                                     repeatCount:0
//    //                                  animationBlock:^(CALayer *layer, CAAnimation *animation) {
//    //                                      animation.removedOnCompletion = NO;
//    //                                      animation.fillMode = kCAFillModeBoth;
//    //                                  }
//    //                          animationDelegateBlock:nil];
//    //
//    //    [_layerAnimation joLayerAnimationWithKeyPath:kJOLayerKeyPathOpacity
//    //                                       fromValue:@(1)
//    //                                         toValue:@(0.)
//    //                                        duration:kAnimationDuraction
//    //                                     repeatCount:0
//    //                                  animationBlock:^(CALayer *layer, CAAnimation *animation) {
//    //                                      animation.removedOnCompletion = NO;
//    //                                      animation.fillMode = kCAFillModeBoth;
//    //                                  }
//    //                          animationDelegateBlock:nil];
//    
//    if (!_animationLayerState) {
//        _animationLayerState = YES;
//        [_layerAnimation joLayerAnimationWithKeyPath:kJOLayerKeyPathScale
//                                           fromValue:@(1)
//                                             toValue:@(maxScale)
//                                            duration:kAnimationDuraction
//                                         repeatCount:0
//                                      animationBlock:^(CALayer *layer, CAAnimation *animation) {
//                                          animation.removedOnCompletion = NO;
//                                          animation.fillMode = kCAFillModeBoth;
//                                      }
//                              animationDelegateBlock:nil];
//        
//        [_layerAnimation joLayerAnimationWithKeyPath:kJOLayerKeyPathOpacity
//                                           fromValue:@(1)
//                                             toValue:@(0.)
//                                            duration:kAnimationDuraction
//                                         repeatCount:0
//                                      animationBlock:^(CALayer *layer, CAAnimation *animation) {
//                                          animation.removedOnCompletion = NO;
//                                          animation.fillMode = kCAFillModeBoth;
//                                      }
//                              animationDelegateBlock:nil];
//    }
//    //    else {
//    //
//    //        CFTimeInterval pausedTime = [_layerAnimation timeOffset];
//    //        [_layerAnimation setSpeed:1.];
//    //        [_layerAnimation setTimeOffset:0.];
//    //        [_layerAnimation setBeginTime:0.];
//    //        CFTimeInterval timeSincePause = [_layerAnimation convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
//    //        [_layerAnimation setBeginTime:timeSincePause];
//    //    }
    
    //////////////////////////////////////////////////////////////////
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(1);
    animation.toValue = @(maxScale);
    animation.duration = kAnimationDuraction;
    animation.repeatCount = MAXFLOAT;
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeBoth;
    [_layerAnimation addAnimation:animation forKey:@"scale"];
}

- (void)stopAnimation {
    
    [_layerAnimation setHidden:YES];
    //    [_layerAnimation removeAllAnimations];
    //    CFTimeInterval pausedTime = [_layerAnimation convertTime:CACurrentMediaTime() fromLayer:nil];
    //    [_layerAnimation setSpeed:0.];
    //    [_layerAnimation setTimeOffset:pausedTime];
}

@end
