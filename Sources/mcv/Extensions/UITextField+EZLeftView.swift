//
//  UITextField+EZLeftView.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public extension UITextField {
    func activateLeftViewWithText(_ text: String) {
        self.setLeftViewWithText(text)
        self.leftViewMode = .always
    }
    
    private func setLeftViewWithText(_ text: String) {
        let mobileNumberCodeLabel = UILabel()
        mobileNumberCodeLabel.textColor = self.textColor
        mobileNumberCodeLabel.font = self.font ?? UIFont.systemFont(ofSize: 15)
        mobileNumberCodeLabel.text = "\(text)"
        mobileNumberCodeLabel.textAlignment = NSTextAlignment.left
        
        let size = mobileNumberCodeLabel.sizeThatFits(.infinity)
        self.leftView = {
            if #available(iOS 12, *) {
                let placeholderRect = self.placeholderRect(
                    forBounds: self.bounds
                )
                let view = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: 45))
                view.clipsToBounds = false
                mobileNumberCodeLabel.frame = CGRect(origin: placeholderRect.origin, size: size)
                view.addSubview(mobileNumberCodeLabel)
                return view
            } else {
                let leftInset: CGFloat = 10
                let view: UIView = UIView(frame: CGRect(
                    x: 0, y: 0,
                    width: size.width + leftInset,
                    height: self.frame.height
                ))
                view.addSubview(mobileNumberCodeLabel)
                mobileNumberCodeLabel.bindFrameToSuperview(withInsets: UIEdgeInsets(
                    left: leftInset
                ))
                return view
            }
        }()
    }
}

