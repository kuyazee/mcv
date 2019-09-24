//
//  Data+String.swift
//  mcv
//
//  Created by z on 24/09/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public extension Data {
    func string(encoding: String.Encoding = String.Encoding.utf8) -> String? {
        return String(data: self, encoding: encoding)
    }
}
