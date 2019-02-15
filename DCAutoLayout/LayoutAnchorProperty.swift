//
//  LayoutAnchorProperty.swift
//  DCAutoLayout
//
//  Created by Dariel on 2019/1/31.
//  Copyright © 2019 Dariel. All rights reserved.
//

import UIKit

public protocol LayoutAnchor {
    
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}
extension NSLayoutAnchor: LayoutAnchor {}


public class LayoutAnchorProperty<Anchor: LayoutAnchor>: LayoutProperty {
    fileprivate let anchor: Anchor
    public var constraint: NSLayoutConstraint?
    
    init(anchor: Anchor, constraint: NSLayoutConstraint? = nil) {
        self.anchor = anchor
    }
}
extension LayoutAnchorProperty {
    func equal(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        constraint = anchor.constraint(equalTo: otherAnchor, constant: constant)
        constraint?.isActive = true
    }
    func greaterThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)
        constraint?.isActive = true
    }
    func lessThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant)
        constraint?.isActive = true
    }
}
