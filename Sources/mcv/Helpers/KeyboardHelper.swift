//
//  KeyboardHelper.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public final class KeyboardHelper {
    private let notificationCenter: NotificationCenter = NotificationCenter.default
    private let view: UIView
    private let autoAdjuster: AutoAdjuster?
    
    public var keyboardWillShowBlock: (UserInfo) -> Void = { _ in }
    public var keyboardWillHideBlock: (UserInfo) -> Void = { _ in }
    public var keyboardDidShowBlock: () -> Void = {}
    public var keyboardDidHideBlock: () -> Void = {}
    
    public init(view: UIView, autoAdjuster: AutoAdjuster? = nil) {
        self.view = view
        self.autoAdjuster = autoAdjuster
    }
    
    public struct UserInfo {
        public let keyboardFrame: CGFloat
        public let animationDuration: Double
        public let animationCurve: UIView.AnimationOptions
        
        fileprivate init(info: KeyboardInfo, view: UIView) {
            let convertedKeyboardEndFrame: CGRect = view.convert(
                info.keyboardEndFrame,
                from: view.window
            )
            self.keyboardFrame = max(0, view.bounds.maxY - convertedKeyboardEndFrame.minY)
            self.animationDuration = info.animationDuration
            self.animationCurve = UIView.AnimationOptions(rawValue: UInt(info.curve << 16))
        }
    }
    
    public struct KeyboardInfo {
        public let animationDuration: Double
        public let keyboardEndFrame: CGRect
        public let curve: UInt32
        
        fileprivate init?(userInfo: [AnyHashable: Any]?) {
            guard let userInfo = userInfo else {
                return nil
            }
            guard let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else {
                return nil
            }
            guard let keyboardEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return nil
            }
            guard let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber else {
                return nil
            }
            
            self.animationDuration = animationDuration
            self.keyboardEndFrame = keyboardEndFrame
            self.curve = curve.uint32Value
        }
    }
    
    public enum AutoAdjuster {
        case bottomConstraint(NSLayoutConstraint)
        case scrollView(UIScrollView)
    }
}

public extension KeyboardHelper {
    @objc
    func dismissKeyboardIfPossible() {
        self.view.endEditing(true)
    }
    
    func viewWillAppear(_ animated: Bool) {
        self.startObservingKeyboard()
    }
    
    func viewWillDisappear(_ animated: Bool) {
        self.stopObservingKeyboard()
    }
    
    var autoAdjustsView: Bool {
        return self.autoAdjuster != nil
    }
}

extension KeyboardHelper {
    private func startObservingKeyboard() {
        self.notificationCenter.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil, queue: nil,
            using: self.keyboardWillShow
        )
        self.notificationCenter.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil, queue: nil,
            using: self.keyboardWillHide
        )
        self.notificationCenter.addObserver(
            forName: UIResponder.keyboardDidShowNotification,
            object: nil, queue: nil,
            using: self.keyboardDidShow
        )
        self.notificationCenter.addObserver(
            forName: UIResponder.keyboardDidHideNotification,
            object: nil, queue: nil,
            using: self.keyboardDidHide
        )
    }
    
    private func stopObservingKeyboard() {
        self.notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        self.notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        self.notificationCenter.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        self.notificationCenter.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
}

extension KeyboardHelper {
    private func keyboardWillShow(_ notification: Notification) {
        if let info = KeyboardInfo(userInfo: notification.userInfo) {
            let userInfo = UserInfo(info: info, view: self.view)
            self.keyboardWillShowBlock(userInfo)
            self.autoAdjustIfNeeded(on: .show, using: userInfo)
        }
    }
    
    private func keyboardWillHide(_ notification: Notification) {
        if let info = KeyboardInfo(userInfo: notification.userInfo) {
            let userInfo = UserInfo(info: info, view: self.view)
            self.keyboardWillHideBlock(userInfo)
            self.autoAdjustIfNeeded(on: .hide, using: userInfo)
        }
    }
    
    private func keyboardDidShow(_ notification: Notification) {
        self.keyboardDidShowBlock()
    }
    
    private func keyboardDidHide(_ notification: Notification) {
        self.keyboardDidHideBlock()
    }
    
    private enum KeyboardState {
        case show, hide
    }
    
    private func autoAdjustIfNeeded(on state: KeyboardState, using info: UserInfo) {
        guard let adjuster = self.autoAdjuster else {
            return
        }
        switch adjuster {
        case .bottomConstraint(let constraint):
            constraint.constant = info.keyboardFrame
            UIView.animate(
                withDuration: info.animationDuration,
                delay: 0.0,
                options: [.beginFromCurrentState, info.animationCurve],
                animations: self.view.layoutIfNeeded,
                completion: nil
            )
        case .scrollView(let scrollView):
            switch state {
            case .show:
                let keyboardInset = UIEdgeInsets(
                    bottom: info.keyboardFrame + 20 // 20 = keyboardTopMargin
                )
                scrollView.contentInset = keyboardInset
                scrollView.scrollIndicatorInsets = keyboardInset
            case .hide:
                scrollView.contentInset = .zero
                scrollView.scrollIndicatorInsets = .zero
            }
        }
    }
}
