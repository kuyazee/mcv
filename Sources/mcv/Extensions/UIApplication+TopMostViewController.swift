//
//  UIApplication+TopMostViewController.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public extension UIApplication {
    var topMostViewController: UIViewController? {
        return self.keyWindow?.rootViewController?.topMostViewController
    }
}

