//
//  Operators.swift
//  DCAutoLayout
//
//  Created by Dariel on 2019/1/31.
//  Copyright © 2019 Dariel. All rights reserved.
//

import UIKit

// MARK: - Other
public func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}
public func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

/// have offset
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}
public func <=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

/// without offset
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}
public func <=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

public func *<B: LayoutDimension>(lhs: B, rhs: CGFloat) -> (B, CGFloat) {
    return (lhs, rhs)
}
public func /<B: LayoutDimension>(lhs: B, rhs: CGFloat) -> (B, CGFloat) {
    return (lhs, 1/rhs)
}
public func +<B: LayoutDimension>(lhs: B, rhs: CGFloat) -> (B, CGFloat) {
    return (lhs, rhs)
}
public func -<B: LayoutDimension>(lhs: B, rhs: CGFloat) -> (B, CGFloat) {
    return (lhs, -rhs)
}

/// 存在otherAnchor和multiplier时constant + - 操作
public func +<B: LayoutDimension>(lhs: (B, CGFloat), rhs: CGFloat) -> ((B, CGFloat), CGFloat) {
    return ((lhs.0, lhs.1), rhs)
}
public func -<B: LayoutDimension>(lhs: (B, CGFloat), rhs: CGFloat) -> ((B, CGFloat), CGFloat) {
    return ((lhs.0, lhs.1), -rhs)
}

/// 只有otherAnchor
public func ==<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: B) {
    lhs.equal(to: rhs)
}
public func >=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: B) {
    lhs.greaterThanOrEqual(to: rhs)
}
public func <=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: B) {
    lhs.lessThanOrEqual(to: rhs)
}

/// otherAnchor * multiplier
public func ==<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: (B, CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.1, constant: 0)
}
public func >=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: (B, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, multiplier: rhs.1, constant: 0)
}
public func <=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: (B, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, multiplier: rhs.1, constant: 0)
}

/// otherAnchor * multiplier + constant
public func ==<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: ((B, CGFloat), CGFloat)) {
    lhs.equal(to: rhs.0.0, multiplier: rhs.0.1, constant: rhs.1)
}
public func >=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: ((B, CGFloat), CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0.0, multiplier: rhs.0.1, constant: rhs.1)
}
public func <=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: ((B, CGFloat), CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0.0, multiplier: rhs.0.1, constant: rhs.1)
}

/// 只有constant
// eg. $0.aWidth == 100
public func ==<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}
public func >=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}
public func <=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: CGFloat) {
    lhs.lessThanOrEqual(to: rhs)
}


/// Extension
// eg. $0.aCenter == view.aCenter
public func ==<X: LayoutAnchor, Y: LayoutAnchor>(lhs:(LayoutAnchorProperty<X>, LayoutAnchorProperty<Y>), rhs: (X, Y)) {
    lhs.0.equal(to: rhs.0)
    lhs.1.equal(to: rhs.1)
}

// eg. $0 == view.marign(top, bottom, left, right)
public func ==(lhs: LayoutProxy, rhs: Margin) {
    lhs.topAnchor.equal(to: rhs.0.0, offsetBy: rhs.0.1)
    lhs.bottomAnchor.equal(to: rhs.1.0, offsetBy: -rhs.1.1)
    lhs.leadingAnchor.equal(to: rhs.2.0, offsetBy: rhs.2.1)
    lhs.trailingAnchor.equal(to: rhs.3.0, offsetBy: -rhs.3.1)
}

// eg. $0.aSize == view.aSize(width, height)
public func ==<B: LayoutDimension>(lhs: (LayoutDimensionProperty<B>, LayoutDimensionProperty<B>), rhs: (CGFloat, CGFloat)) {
    lhs.0.equal(to: rhs.0)
    lhs.1.equal(to: rhs.1)
}
