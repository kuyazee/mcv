//
//  UIEdgeInsets.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }
    
    init(leftRight side: CGFloat) {
        self.init(top: 0, left: side, bottom: 0, right: side)
    }
    
    init(topBottom side: CGFloat) {
        self.init(top: side, left: 0, bottom: side, right: 0)
    }
    
    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }
    
    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }
    
    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }
    
    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
}

