//
//  Result+Extensions.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public extension Result where Success == Void {
    static func success() -> Result {
        return Result.success(())
    }
}

public extension Result {
    var result: Success? {
        switch self {
        case .failure:
            return nil
        case .success(let result):
            return result
        }
    }
    
    var error: Failure? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
    
    var isSuccess: Bool {
        return self.result != nil
    }
    
    var isFailure: Bool {
        return !self.isSuccess
    }
}
