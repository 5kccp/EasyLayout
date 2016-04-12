//
//  UIView+AGAutoLayout.m
//  AGJointOperationSDK
//
//  Created by Mao on 16/3/2.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "UIView+AGAutoLayout.h"

BOOL AGFloatNotEqual(CGFloat a, CGFloat b){
    if (fabs(a - b) > FLT_EPSILON) {
        return YES;
    }
    return NO;
}

@implementation UIView (AGAutoLayout)
- (UIView*(^)(CGFloat w,CGFloat h))ag_toSize{
    return ^UIView*(CGFloat w,CGFloat h){
        return self.ag_toWidth(w).ag_toHeight(h);
    };
}
- (UIView*(^)(CGFloat))ag_toWidth{
    return ^UIView*(CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:constant];
        [self addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(CGFloat))ag_toHeight{
    return ^UIView*(CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:constant];
        [self addConstraint:constraint];
        return self;
    };
}

- (UIView*(^)(NSLayoutAttribute attr1, NSLayoutRelation relation, UIView *toView, NSLayoutAttribute attr2, CGFloat multiplier, CGFloat constant))ag_constraintTo{
    return ^UIView*(NSLayoutAttribute attr1, NSLayoutRelation relation, UIView *toView, NSLayoutAttribute attr2, CGFloat multiplier, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attr1 relatedBy:relation toItem:toView attribute:attr2 multiplier:multiplier constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)())ag_centreToSuperView{
    return ^UIView*{
        return self.ag_centreXToSuperView().ag_centreYToSuperView();
    };
}
- (UIView*(^)())ag_centreXToSuperView{
    return ^UIView*{
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)())ag_centreYToSuperView{
    return ^UIView*{
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [self.superview addConstraint:constraint];
        return self;
    };
}

- (UIView*(^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))ag_edgeToSuperView{
    return ^UIView*(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        if (AGFloatNotEqual(top, AGINVALID_EDGE)) {
            self.ag_topToSuperView(top);
        }
        if (AGFloatNotEqual(left, AGINVALID_EDGE)) {
            self.ag_leftToSuperView(left);
        }
        if (AGFloatNotEqual(bottom, AGINVALID_EDGE)) {
            self.ag_bottomToSuperView(bottom);
        }
        if (AGFloatNotEqual(right, AGINVALID_EDGE)) {
            self.ag_rightToSuperView(right);
        }
        return self;
    };
}
- (UIView*(^)(CGFloat))ag_topToSuperView{
    return ^UIView*(CGFloat constant){
                self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(CGFloat))ag_leftToSuperView{
    return ^UIView*(CGFloat constant){
                self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(CGFloat))ag_bottomToSuperView{
    return ^UIView*(CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:-constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(CGFloat))ag_rightToSuperView{
    return ^UIView*(CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:-constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}

- (UIView*(^)(UIView*,CGFloat))ag_topToView{
    return ^UIView*(UIView *view, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(UIView*,CGFloat))ag_leftToView{
    return ^UIView*(UIView *view, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(UIView*,CGFloat))ag_bottomToView{
    return ^UIView*(UIView *view, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:-constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(UIView*,CGFloat))ag_rightToView{
    return ^UIView*(UIView *view, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}

- (NSLayoutConstraint*)ag_constraintTopToSuperView{
    if (self.superview) {
        for (NSLayoutConstraint *each in self.superview.constraints) {
            if([each isMemberOfClass:[NSLayoutConstraint class]]){
                if(([each.firstItem isEqual:self] && each.firstAttribute == NSLayoutAttributeTop) || ([each.secondItem isEqual:self.superview] && each.secondAttribute == NSLayoutAttributeTop)){
                    return each;
                }
            }
        }
    }
    return nil;
}
- (NSLayoutConstraint*)ag_constraintLeftToSuperView{
    if (self.superview) {
        for (NSLayoutConstraint *each in self.superview.constraints) {
            if([each isMemberOfClass:[NSLayoutConstraint class]]){
                if(([each.firstItem isEqual:self] && each.firstAttribute == NSLayoutAttributeLeft) || ([each.secondItem isEqual:self.superview] && each.secondAttribute == NSLayoutAttributeLeft)){
                    return each;
                }
            }
        }
    }
    return nil;
}
- (NSLayoutConstraint*)ag_constraintBottomToSuperView{
    if (self.superview) {
        for (NSLayoutConstraint *each in self.superview.constraints) {
            if([each isMemberOfClass:[NSLayoutConstraint class]]){
                if(([each.firstItem isEqual:self] && each.firstAttribute == NSLayoutAttributeBottom) || ([each.secondItem isEqual:self.superview] && each.secondAttribute == NSLayoutAttributeBottom)){
                    return each;
                }
            }
        }
    }
    return nil;
}
- (NSLayoutConstraint*)ag_constraintRightToSuperView{
    if (self.superview) {
        for (NSLayoutConstraint *each in self.superview.constraints) {
            if([each isMemberOfClass:[NSLayoutConstraint class]]){
                if(([each.firstItem isEqual:self] && each.firstAttribute == NSLayoutAttributeRight) || ([each.secondItem isEqual:self.superview] && each.secondAttribute == NSLayoutAttributeRight)){
                    return each;
                }
            }
        }
    }
    return nil;
}
@end
