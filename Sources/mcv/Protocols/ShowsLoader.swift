//
//  ShowsLoader.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public protocol ShowsLoader {
    func showLoader(disablesView: Bool)
    
    func hideLoader()
}

public extension ShowsLoader {
    func showLoader() {
        self.showLoader(disablesView: true)
    }
}
