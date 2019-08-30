//
//  String.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public extension String {
    func isValidForRegex(_ expression: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", expression).evaluate(with: self)
    }
    
    func isNotValidForRegex(_ expression: String) -> Bool {
        return !self.isValidForRegex(expression)
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var containsWhiteSpaces: Bool {
        return self.containsCharacters(from: .whitespaces)
    }
    
    var containsNewlines: Bool {
        return self.containsCharacters(from: .newlines)
    }
    
    func containsCharacters(from characterSet: CharacterSet) -> Bool {
        return self.rangeOfCharacter(from: characterSet) != nil
    }
}

