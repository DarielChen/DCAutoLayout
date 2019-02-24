//
//  Operators.swift
//  DCAutoLayout
//
//  Created by Dariel on 2019/1/31.
//  Copyright © 2019 Dariel. All rights reserved.
//

import UIKit

/// eg. view.leadingAnchor + 20
public func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}
/// eg. view.leadingAnchor - 20
public func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

/// eg. $0.leadingAnchor == view.leadingAnchor + 20
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}
/// eg. $0.leadingAnchor >= view.leadingAnchor + 20
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}
/// eg. $0.leadingAnchor <= view.leadingAnchor + 20
public func <=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

/// eg. $0.leadingAnchor == view.leadingAnchor
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}
/// eg. $0.leadingAnchor >= view.leadingAnchor
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}
/// eg. $0.leadingAnchor <= view.leadingAnchor
public func <=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}




/// eg. view.widthAnchor * 3
public func *<B: LayoutDimension>(lhs: B, rhs: CGFloat) -> (B, CGFloat) {
    return (lhs, rhs)
}
/// eg. view.widthAnchor / 3
public func /<B: LayoutDimension>(lhs: B, rhs: CGFloat) -> (B, CGFloat) {
    return (lhs, 1/rhs)
}
/// eg. view.widthAnchor * 1.2 + 30
public func +<B: LayoutDimension>(lhs: (B, CGFloat), rhs: CGFloat) -> ((B, CGFloat), CGFloat) {
    return ((lhs.0, lhs.1), rhs)
}
/// eg. view.widthAnchor * 1.2 - 30
public func -<B: LayoutDimension>(lhs: (B, CGFloat), rhs: CGFloat) -> ((B, CGFloat), CGFloat) {
    return ((lhs.0, lhs.1), -rhs)
}

/// eg. $0.heightAnchor == view.widthAnchor
public func ==<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: B) {
    lhs.equal(to: rhs)
}
/// eg. $0.heightAnchor >= view.widthAnchor
public func >=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: B) {
    lhs.greaterThanOrEqual(to: rhs)
}
/// eg. $0.heightAnchor <= view.widthAnchor
public func <=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: B) {
    lhs.lessThanOrEqual(to: rhs)
}

/// eg. $0.heightAnchor == view.widthAnchor * 1.2
public func ==<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: (B, CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.1, constant: 0)
}
/// eg. $0.heightAnchor >= view.widthAnchor * 1.2
public func >=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: (B, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, multiplier: rhs.1, constant: 0)
}
/// eg. $0.heightAnchor <= view.widthAnchor * 1.2
public func <=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: (B, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, multiplier: rhs.1, constant: 0)
}

/// have multiplier and constant
/// eg. $0.heightAnchor == view.widthAnchor * 1.2 + 30
public func ==<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: ((B, CGFloat), CGFloat)) {
    lhs.equal(to: rhs.0.0, multiplier: rhs.0.1, constant: rhs.1)
}
/// eg. $0.heightAnchor >= view.widthAnchor * 1.2 + 30
public func >=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: ((B, CGFloat), CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0.0, multiplier: rhs.0.1, constant: rhs.1)
}
/// eg. $0.heightAnchor <= view.widthAnchor * 1.2 + 30
public func <=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: ((B, CGFloat), CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0.0, multiplier: rhs.0.1, constant: rhs.1)
}

/// only have constant
// eg. $0.heightAnchor == 100
public func ==<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}
// eg. $0.heightAnchor >= 100
public func >=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}
// eg. $0.heightAnchor <= 100
public func <=<B: LayoutDimension>(lhs: LayoutDimensionProperty<B>, rhs: CGFloat) {
    lhs.lessThanOrEqual(to: rhs)
}


/// Extension
// eg. $0.centerAnchor == view.centerAnchor
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

// eg. $0.sizeAnchor == view.size(width, height)
public func ==<B: LayoutDimension>(lhs: (LayoutDimensionProperty<B>, LayoutDimensionProperty<B>), rhs: (CGFloat, CGFloat)) {
    lhs.0.equal(to: rhs.0)
    lhs.1.equal(to: rhs.1)
}
