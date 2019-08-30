//
//  UIView+KeyboardDismiss.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public extension UIView {
    @discardableResult
    func autoDismissKeyboardOnTap() -> UITapGestureRecognizer {
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(self.dismissKeyboardIfPossible)
        )
        tapGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(tapGesture)
        return tapGesture
    }
    
    @objc
    private func dismissKeyboardIfPossible() {
        self.endEditing(true)
    }
}

