//
//  UIViewController+TopMostViewController.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public extension UIViewController {
    var topMostViewController: UIViewController? {
        return self.getVisibleViewController(self)
    }
    
    private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
        // UIViewControler
        if let presentedViewController = rootViewController.presentedViewController {
            return self.getVisibleViewController(presentedViewController)
        }
        
        // UINavigationController
        if let navigationController = rootViewController as? UINavigationController {
            guard let visibleViewController = navigationController.visibleViewController else {
                return rootViewController
            }
            return self.getVisibleViewController(visibleViewController)
        }
        
        // UITabBarController
        if let tabBarController = rootViewController as? UITabBarController {
            guard let selectedViewController = tabBarController.selectedViewController else {
                return rootViewController
            }
            return self.getVisibleViewController(selectedViewController)
        }
        
        // TODO: Add Closure Here to support Custom UIViewControllers
        // if let viewController as .......
        
        return rootViewController
    }
}

