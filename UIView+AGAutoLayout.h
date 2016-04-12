//
//  UIView+AGAutoLayout.h
//  AGJointOperationSDK
//
//  Created by Mao on 16/3/2.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AGINVALID_EDGE MAXFLOAT

@interface UIView (AGAutoLayout)
- (UIView*(^)(CGFloat w,CGFloat h))ag_toSize;
- (UIView*(^)(CGFloat w))ag_toWidth;
- (UIView*(^)(CGFloat h))ag_toHeight;

- (UIView*(^)(NSLayoutAttribute attr1, NSLayoutRelation relation, UIView *toView, NSLayoutAttribute attr2, CGFloat multiplier, CGFloat constant))ag_constraintTo;

- (UIView*(^)())ag_centreToSuperView;
- (UIView*(^)())ag_centreXToSuperView;
- (UIView*(^)())ag_centreYToSuperView;

- (UIView*(^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))ag_edgeToSuperView;
- (UIView*(^)(CGFloat constant))ag_topToSuperView;
- (UIView*(^)(CGFloat constant))ag_leftToSuperView;
- (UIView*(^)(CGFloat constant))ag_bottomToSuperView;
- (UIView*(^)(CGFloat constant))ag_rightToSuperView;

- (UIView*(^)(UIView *toView,CGFloat constant))ag_topToView;
- (UIView*(^)(UIView *toView,CGFloat constant))ag_leftToView;
- (UIView*(^)(UIView *toView,CGFloat constant))ag_bottomToView;
- (UIView*(^)(UIView *toView,CGFloat constant))ag_rightToView;

- (NSLayoutConstraint*)ag_constraintTopToSuperView;
- (NSLayoutConstraint*)ag_constraintLeftToSuperView;
- (NSLayoutConstraint*)ag_constraintBottomToSuperView;
- (NSLayoutConstraint*)ag_constraintRightToSuperView;

@end
