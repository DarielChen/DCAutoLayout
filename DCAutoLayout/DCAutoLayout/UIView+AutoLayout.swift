//
//  UIView+AutoLayout.swift
//  DCAutoLayout
//
//  Created by Dariel on 2019/1/31.
//  Copyright © 2019 Dariel. All rights reserved.
//

import UIKit

public typealias Margin = ((NSLayoutYAxisAnchor, CGFloat), (NSLayoutYAxisAnchor, CGFloat), (NSLayoutXAxisAnchor, CGFloat), (NSLayoutXAxisAnchor, CGFloat))

private var layoutProxyKey: Void?
extension UIView {
    
    var layoutProxy: LayoutProxy? {
        get { return objc_getAssociatedObject(self, &layoutProxyKey) as? LayoutProxy }
        set { objc_setAssociatedObject(self, &layoutProxyKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
    }
    
    
    public func removeAllAnchor() {
        layoutProxy?.removeAllAnchor()
    }
    
    public func layout(_ closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if layoutProxy == nil {
            layoutProxy = LayoutProxy(view: self)
        }
        if let layoutProxy = layoutProxy {
            layoutProxy.constraintClosure = { constraint in
                self.removeConstraint(constraint)
                constraint.isActive = false
            }
            layoutProxy.constraintsClosure = { constraints in
                for constraint in constraints {
                    constraint.isActive = false
                    self.removeConstraint(constraint)                    
                }
            }
            closure(layoutProxy)
        }
    }
    
    public var centerAnchor: (NSLayoutXAxisAnchor, NSLayoutYAxisAnchor) {
        return (centerXAnchor, centerYAnchor)
    }
    
    public func marign(_ topF: CGFloat, _ bottomF: CGFloat, _ leftF: CGFloat,  _ rightF: CGFloat) -> Margin {
        return ((topAnchor, topF), (bottomAnchor, bottomF), (leadingAnchor, leftF),  (trailingAnchor, rightF))
    }
    
    public func size(_ width: CGFloat, _ height: CGFloat) -> (CGFloat, CGFloat) {
        return (width, height)
    }
        
    public var safeAreaLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.leadingAnchor
        } else {
            return leadingAnchor
        }
    }
    public var safeAreaTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.trailingAnchor
        } else {
            return trailingAnchor
        }
    }
    public var safeAreaLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.leftAnchor
        } else {
            return leftAnchor
        }
    }
    public var safeAreaRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.rightAnchor
        } else {
            return rightAnchor
        }
    }
    public var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }
    public var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomAnchor
        }
    }
    public var safeAreaWidthAnchor: NSLayoutDimension {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.widthAnchor
        } else {
            return widthAnchor
        }
    }
    public var safeAreaHeightAnchor: NSLayoutDimension {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.heightAnchor
        } else {
            return heightAnchor
        }
    }
    public var safeAreaCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.centerXAnchor
        } else {
            return centerXAnchor
        }
    }
    public var safeAreaCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.centerYAnchor
        } else {
            return centerYAnchor
        }
    }
}

