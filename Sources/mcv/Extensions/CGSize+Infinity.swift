//
//  CGSize+Infinity.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public extension CGSize {
    static var infinity: CGSize {
        return CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
    }
}
