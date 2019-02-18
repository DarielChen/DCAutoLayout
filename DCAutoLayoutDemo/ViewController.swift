//
//  ViewController.swift
//  DCAutoLayoutDemo
//
//  Created by Dariel on 2019/1/31.
//  Copyright © 2019 Dariel. All rights reserved.
//

import UIKit
import DCAutoLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button1)
        view.addSubview(button2)
        
       action2Touch()
    }
    
    
    @objc func action1Touch() {
        
        button1.removeAllAnchor()
        button2.removeAllAnchor()
        
        button1.layout {
            $0.topAnchor == view.safeAreaTopAnchor + 20
            $0.leadingAnchor == view.leadingAnchor + 20
            $0.bottomAnchor == view.bottomAnchor - 20
            $0.widthAnchor == button2.widthAnchor
        }
        
        button2.layout {
            $0.topAnchor == button1.topAnchor
            $0.leadingAnchor == button1.trailingAnchor + 20
            $0.bottomAnchor == button1.bottomAnchor
            $0.trailingAnchor == view.trailingAnchor - 20
        }
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func action2Touch() {
        
        button1.removeAllAnchor()
        button2.removeAllAnchor()
        
        button1.layout {
            $0.topAnchor == view.safeAreaTopAnchor + 20
            $0.leadingAnchor == view.leadingAnchor + 20
            $0.trailingAnchor == view.trailingAnchor - 20
            $0.heightAnchor == button2.heightAnchor
        }
        
        button2.layout {
            $0.topAnchor == button1.bottomAnchor + 20
            $0.leadingAnchor == view.leadingAnchor + 20
            $0.trailingAnchor == view.trailingAnchor - 20
            $0.bottomAnchor == view.bottomAnchor - 20
        }
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("Left/Top", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(0x4169E1)
        button.addTarget(self, action: #selector(action1Touch), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Right/Bottom", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(0x87CEFA)
        button.addTarget(self, action: #selector(action2Touch), for: .touchUpInside)
        return button
    }()
}
