//
//  UIView+AGAutoLayout.h
//  AGJointOperationSDK
//
//  Created by Mao on 16/3/2.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <UIKit/UIKit.h>

#define EL_INGNORE MAXFLOAT

@interface UIView (EasyLayout)
- (UIView*(^)(CGFloat width,CGFloat height))el_toSize;
- (UIView*(^)(CGFloat width))el_toWidth;
- (UIView*(^)(CGFloat height))el_toHeight;

- (UIView*(^)(NSLayoutAttribute attr1, NSLayoutRelation relation, UIView *toView, NSLayoutAttribute attr2, CGFloat multiplier, CGFloat constant))el_constraintTo;

- (UIView*(^)())el_centreToSuperView;
- (UIView*(^)())el_axisXToSuperView;
- (UIView*(^)())el_axisYToSuperView;

- (UIView*(^)(UIView *view))el_centreTo;
- (UIView*(^)(UIView *view))el_sameAgixXTo;
- (UIView*(^)(UIView *view))el_sameAgixYTo;

- (UIView*(^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))el_edgeToSuperView;

- (UIView*(^)(CGFloat constant))el_topToSuperView;
- (UIView*(^)(CGFloat constant))el_leftToSuperView;
- (UIView*(^)(CGFloat constant))el_bottomToSuperView;
- (UIView*(^)(CGFloat constant))el_rightToSuperView;

- (UIView*(^)(UIView *toView,CGFloat constant))el_topToView;
- (UIView*(^)(UIView *toView,CGFloat constant))el_leftToView;
- (UIView*(^)(UIView *toView,CGFloat constant))el_bottomToView;
- (UIView*(^)(UIView *toView,CGFloat constant))el_rightToView;

- (UIView*(^)(UIViewController * viewController))el_stickToTopLayoutGuide;
- (UIView*(^)(UIViewController * viewController))el_stickToBottomLayoutGuide;

- (UIView*(^)(UIViewController * viewController, CGFloat inset))el_closeToTopLayoutGuide;
- (UIView*(^)(UIViewController * viewController, CGFloat inset))el_closeToBottomLayoutGuide;

- (UIView*(^)(UIViewController * viewController, CGFloat inset, NSLayoutRelation relation))el_toTopLayoutGuide;
- (UIView*(^)(UIViewController * viewController, CGFloat inset, NSLayoutRelation relation))el_toBottomLayoutGuide;


@end

@interface UIView (EasyLayout_Helper)
- (NSLayoutConstraint*)el_constraintTopToSuperView;
- (NSLayoutConstraint*)el_constraintLeftToSuperView;
- (NSLayoutConstraint*)el_constraintBottomToSuperView;
- (NSLayoutConstraint*)el_constraintRightToSuperView;
@end
