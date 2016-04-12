//
//  UIView+AGAutoLayout.m
//  AGJointOperationSDK
//
//  Created by Mao on 16/3/2.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "UIView+EasyLayout.h"

static BOOL ELFloatNotEqual(CGFloat a, CGFloat b){
    if (fabs(a - b) > FLT_EPSILON) {
        return YES;
    }
    return NO;
}

@implementation UIView (EasyLayout)
- (UIView*(^)(CGFloat w,CGFloat h))el_toSize{
    return ^UIView*(CGFloat w,CGFloat h){
        return self.el_toWidth(w).el_toHeight(h);
    };
}
- (UIView*(^)(CGFloat))el_toWidth{
    return ^UIView*(CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:constant];
        [self addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(CGFloat))el_toHeight{
    return ^UIView*(CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:constant];
        [self addConstraint:constraint];
        return self;
    };
}

- (UIView*(^)(NSLayoutAttribute attr1, NSLayoutRelation relation, UIView *toView, NSLayoutAttribute attr2, CGFloat multiplier, CGFloat constant))el_constraintTo{
    return ^UIView*(NSLayoutAttribute attr1, NSLayoutRelation relation, UIView *toView, NSLayoutAttribute attr2, CGFloat multiplier, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attr1 relatedBy:relation toItem:toView attribute:attr2 multiplier:multiplier constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)())el_centreToSuperView{
    return ^UIView*{
        return self.el_axisXToSuperView().el_axisYToSuperView();
    };
}
- (UIView*(^)())el_axisXToSuperView{
    return ^UIView*{
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)())el_axisYToSuperView{
    return ^UIView*{
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [self.superview addConstraint:constraint];
        return self;
    };
}

- (UIView*(^)(UIView *view))el_centreTo{
    return ^UIView*(UIView *view){
        self.el_sameAgixXTo(view).el_sameAgixYTo(view);
        return self;
    };
}
- (UIView*(^)(UIView *view))el_sameAgixXTo{
    return ^UIView*(UIView *view){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(UIView *view))el_sameAgixYTo{
    return ^UIView*(UIView *view){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [self.superview addConstraint:constraint];
        return self;
    };
}

- (UIView*(^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))el_edgeToSuperView{
    return ^UIView*(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        if (ELFloatNotEqual(top, EL_INGNORE)) {
            self.el_topToSuperView(top);
        }
        if (ELFloatNotEqual(left, EL_INGNORE)) {
            self.el_leftToSuperView(left);
        }
        if (ELFloatNotEqual(bottom, EL_INGNORE)) {
            self.el_bottomToSuperView(bottom);
        }
        if (ELFloatNotEqual(right, EL_INGNORE)) {
            self.el_rightToSuperView(right);
        }
        return self;
    };
}
- (UIView*(^)(CGFloat))el_topToSuperView{
    return ^UIView*(CGFloat constant){
                self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(CGFloat))el_leftToSuperView{
    return ^UIView*(CGFloat constant){
                self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(CGFloat))el_bottomToSuperView{
    return ^UIView*(CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:-constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(CGFloat))el_rightToSuperView{
    return ^UIView*(CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:-constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}

- (UIView*(^)(UIView*,CGFloat))el_topToView{
    return ^UIView*(UIView *view, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(UIView*,CGFloat))el_leftToView{
    return ^UIView*(UIView *view, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(UIView*,CGFloat))el_bottomToView{
    return ^UIView*(UIView *view, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:-constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(UIView*,CGFloat))el_rightToView{
    return ^UIView*(UIView *view, CGFloat constant){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:constant];
        [self.superview addConstraint:constraint];
        return self;
    };
}

- (UIView*(^)(UIViewController * viewController))el_stickToTopLayoutGuide{
    return ^UIView*(UIViewController * viewController){
        return self.el_closeToTopLayoutGuide(viewController, 0);
    };
}
- (UIView*(^)(UIViewController * viewController))el_stickToBottomLayoutGuide{
    return ^UIView*(UIViewController * viewController){
        return self.el_closeToBottomLayoutGuide(viewController, 0);
    };
}

- (UIView*(^)(UIViewController * viewController, CGFloat inset))el_closeToTopLayoutGuide{
    return ^UIView*(UIViewController * viewController, CGFloat inset){
        return self.el_toTopLayoutGuide(viewController, inset, NSLayoutRelationEqual);
    };
}
- (UIView*(^)(UIViewController * viewController, CGFloat inset))el_closeToBottomLayoutGuide{
    return ^UIView*(UIViewController * viewController, CGFloat inset){
        return self.el_toBottomLayoutGuide(viewController, inset, NSLayoutRelationEqual);
    };
}

- (UIView*(^)(UIViewController * viewController, CGFloat inset, NSLayoutRelation relation))el_toTopLayoutGuide{
    return ^UIView*(UIViewController * viewController, CGFloat inset, NSLayoutRelation relation){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:relation toItem:viewController.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:inset];
        [viewController.view  addConstraint:constraint];
        return self;
    };
}
- (UIView*(^)(UIViewController * viewController, CGFloat inset, NSLayoutRelation relation))el_toBottomLayoutGuide{
    return ^UIView*(UIViewController * viewController, CGFloat inset, NSLayoutRelation relation){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        inset = -inset;
        if (relation == NSLayoutRelationLessThanOrEqual) {
            relation = NSLayoutRelationGreaterThanOrEqual;
        } else if (relation == NSLayoutRelationGreaterThanOrEqual) {
            relation = NSLayoutRelationLessThanOrEqual;
        }
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:relation toItem:viewController.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:inset];
        [viewController.view addConstraint:constraint];
        return self;
    };
}
@end

@implementation UIView (EasyLayout_Helper)

- (NSLayoutConstraint*)el_constraintTopToSuperView{
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
- (NSLayoutConstraint*)el_constraintLeftToSuperView{
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
- (NSLayoutConstraint*)el_constraintBottomToSuperView{
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
- (NSLayoutConstraint*)el_constraintRightToSuperView{
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
