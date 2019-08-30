//
//  UIView+BindFrame.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public extension UIView {
    func addSubview(_ view: UIView, andBindFrameWithInsets contentInsets: UIEdgeInsets) {
        self.addSubview(view)
        view.bindFrameToSuperview(withInsets: contentInsets)
    }
    
    func bindFrameToSuperview(withInsets contentInsets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            fatalError("`superview` was nil – call `addSubview(_:)` before calling `\(#function)` to fix this.")
        }
        
        let constraints: [String] = [
            "H:|-\(contentInsets.left)-[subview]-\(contentInsets.right)-|",
            "V:|-\(contentInsets.top)-[subview]-\(contentInsets.bottom)-|"
        ]
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(constraints.flatMap {
            NSLayoutConstraint.constraints(
                withVisualFormat: $0,
                options: NSLayoutConstraint.FormatOptions(),
                metrics: nil,
                views: ["subview": self]
            )
        })
    }
}


