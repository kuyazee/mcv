//
//  UIBarButtonItem.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    static var untitledBarButtonItem: UIBarButtonItem {
        return UIBarButtonItem(
            title: " ",
            style: .plain,
            target: self,
            action: nil
        )
    }
}

