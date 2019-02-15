//
//  LayoutProperty.swift
//  DCAutoLayout
//
//  Created by Dariel on 2019/1/31.
//  Copyright © 2019 Dariel. All rights reserved.
//

import UIKit

public protocol LayoutProperty {
    
    var constraint: NSLayoutConstraint? { get set }
    func setConstant(_ constant: CGFloat)
    func getConstant() -> CGFloat
}

extension LayoutProperty {
    public func setConstant(_ constant: CGFloat) {
        constraint?.constant = constant
    }
    public func getConstant() -> CGFloat {
        return constraint?.constant ?? 0
    }
}
