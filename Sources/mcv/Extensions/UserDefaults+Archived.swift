//
//  UserDefaults+Archived.swift
//  mcv
//
//  Created by z on 30/08/2019.
//  Copyright © 2019 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public extension UserDefaults {
    func setArchived(_ value: Any?, forKey key: String) {
        if let value = value {
            let object = NSKeyedArchiver.archivedData(withRootObject: value)
            self.set(object, forKey: key)
        } else {
            self.set(value, forKey: key)
        }
    }
    
    func archivedObject(forKey key: String) -> Any? {
        guard let data = self.object(forKey: key) as? Data else {
            return nil
        }
        return NSKeyedUnarchiver.unarchiveObject(with: data)
        
    }
    
    func archivedObject<T>(forKey key: String) -> T? {
        guard let data = self.object(forKey: key) as? Data else {
            return nil
        }
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? T
    }
}
