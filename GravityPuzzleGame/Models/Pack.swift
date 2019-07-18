//
//  Pack.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class Pack {
    
    var isCompleted: Bool
    var purchased: Bool
    var levels: [Level]
    
    init(isCompleted: Bool, purchased: Bool, levels: [Level]) {
        self.isCompleted = isCompleted
        self.purchased = purchased
        self.levels = levels
        
    }
}
