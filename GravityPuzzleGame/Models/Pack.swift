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
    let levels: [Level]
    var purchased: Bool
    
    init(isCompleted: Bool, levels: [Level], purchased: Bool) {
        self.isCompleted = isCompleted
        self.levels = levels
        self.purchased = purchased
    }
}
