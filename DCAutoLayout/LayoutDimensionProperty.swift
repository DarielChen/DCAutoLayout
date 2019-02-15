//
//  LayoutDimensionProperty.swift
//  DCAutoLayout
//
//  Created by Dariel on 2019/1/31.
//  Copyright © 2019 Dariel. All rights reserved.
//

import UIKit

public protocol LayoutDimension {
    /*
     thisVariable = constant.
     */
    func constraint(equalToConstant float: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualToConstant float: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant float: CGFloat) -> NSLayoutConstraint
    
    /*
     thisAnchor = otherAnchor * multiplier + constant.
     */
    func constraint(equalTo anchor: Self, multiplier mul: CGFloat, constant float: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, multiplier mul: CGFloat,
                    constant float: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, multiplier mul: CGFloat,
                    constant float: CGFloat) -> NSLayoutConstraint
}
extension NSLayoutDimension: LayoutDimension {}

public class LayoutDimensionProperty<Anchor: LayoutDimension>: LayoutProperty {
    
    fileprivate let anchor: Anchor
    public var constraint: NSLayoutConstraint?
    
    init(anchor: Anchor, constraint: NSLayoutConstraint? = nil) {
        self.anchor = anchor
    }
}
extension LayoutDimensionProperty {
    func equal(to constant: CGFloat = 0) {
        constraint = anchor.constraint(equalToConstant: constant)
        constraint?.isActive = true
    }
    func greaterThanOrEqual(to constant: CGFloat = 0) {
        constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint?.isActive = true
    }
    func lessThanOrEqual(to constant: CGFloat = 0) {
        constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        constraint?.isActive = true
    }
    func equal(to otherAnchor: Anchor, multiplier mul: CGFloat = 1.0, constant con: CGFloat = 0.0) {
        constraint = anchor.constraint(equalTo: otherAnchor, multiplier: mul, constant: con)
        constraint?.isActive = true
    }
    func greaterThanOrEqual(to otherAnchor: Anchor, multiplier mul: CGFloat = 1.0, constant con: CGFloat = 0.0) {
        constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, multiplier: mul, constant: con)
        constraint?.isActive = true
    }
    func lessThanOrEqual(to otherAnchor: Anchor, multiplier mul: CGFloat = 1.0, constant con: CGFloat = 0.0) {
        constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, multiplier: mul, constant: con)
        constraint?.isActive = true
    }
}
