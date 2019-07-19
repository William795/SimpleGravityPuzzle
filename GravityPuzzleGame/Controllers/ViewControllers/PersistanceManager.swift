//
//  PersistanceManager.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/19/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation


class PersistanceManager {
    
    // level complete
    static func updateLevel(_ levelNumber: Int, complete: Bool) {
        UserDefaults.standard.set(complete, forKey: "level \(levelNumber)")
    }
    
    // check for levels
    static func fetchLevelCompletion(for numberOfLevels: Int) -> [String : Bool] {
        
        var keyValueDict = [String : Bool]()
        
        for level in 0...numberOfLevels {
            let key = "level \(level + 1)"
            let value = UserDefaults.standard.value(forKey: key) as? Bool ?? false
            keyValueDict[key] = value
        }
        return keyValueDict
    }
}
