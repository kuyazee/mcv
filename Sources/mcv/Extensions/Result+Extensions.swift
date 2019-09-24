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
    /// Returns the `Success` if it has a value
    var result: Success? {
        switch self {
        case .failure:
            return nil
        case .success(let result):
            return result
        }
    }
    
    /// Returns the `Failure` if it has a value
    var error: Failure? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
    
    /// Returns `true` if the `Result` is a success
    var isSuccess: Bool {
        return self.result != nil
    }
    
    /// Returns `true` if the `Result` is a failure
    var isFailure: Bool {
        return !self.isSuccess
    }
}
