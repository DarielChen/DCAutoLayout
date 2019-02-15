//
//  LayoutProxy.swift
//  DCAutoLayout
//
//  Created by Dariel on 2019/1/31.
//  Copyright © 2019 Dariel. All rights reserved.
//

import UIKit

public typealias CallbackConstraintClosure = (NSLayoutConstraint) -> Void
public typealias CallbackConstraintsClosure = ([NSLayoutConstraint]) -> Void

public class LayoutProxy: NSObject, NSCopying {
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
    
    var constraintClosure: CallbackConstraintClosure!
    var constraintsClosure: CallbackConstraintsClosure!

    public lazy var leftAnchor = anchorproperty(with: view.leftAnchor)
    public lazy var rightAnchor = anchorproperty(with: view.rightAnchor)
    public lazy var topAnchor = anchorproperty(with: view.topAnchor)
    public lazy var bottomAnchor = anchorproperty(with: view.bottomAnchor)
    public lazy var leadingAnchor = anchorproperty(with: view.leadingAnchor)
    public lazy var trailingAnchor = anchorproperty(with: view.trailingAnchor)
    public lazy var centerXAnchor = anchorproperty(with: view.centerXAnchor)
    public lazy var centerYAnchor = anchorproperty(with: view.centerYAnchor)
    public lazy var widthAnchor = dimensionProperty(with: view.widthAnchor)
    public lazy var heightAnchor = dimensionProperty(with: view.heightAnchor)
    
    public lazy var centerAnchor = (centerXAnchor, centerYAnchor)
    public lazy var sizeAnchor = (widthAnchor, heightAnchor)
    
    private let view: UIView
    init(view: UIView) {
        self.view = view
    }
    private func anchorproperty<A: LayoutAnchor>(with anchor: A) -> LayoutAnchorProperty<A> {
        let property = LayoutAnchorProperty(anchor: anchor)
        return property
    }
    private func dimensionProperty<B: LayoutDimension>(with anchor: B) -> LayoutDimensionProperty<B> {
        let property = LayoutDimensionProperty(anchor: anchor)
        return property
    }
    
    public func removeAnchor(_ anchor: LayoutProperty) {
        if let constraint = anchor.constraint {
            constraintClosure(constraint)
        }
    }
    
    func removeAllAnchor() {
        let anchorArr: [LayoutProperty] = [leftAnchor, rightAnchor, topAnchor, bottomAnchor, leadingAnchor, trailingAnchor, centerXAnchor, centerYAnchor, widthAnchor, heightAnchor]
        var constraintArr: [NSLayoutConstraint] = []
        for anchor in anchorArr {
            if let constraint = anchor.constraint {
                constraintArr.append(constraint)
            }
        }
        constraintsClosure(constraintArr)
    }
}
