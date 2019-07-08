//
//  Level.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class Level {
    
    let blocks: [Block]
    let walls: [Wall]
    var isComplete: Bool
    
    init(blocks: [Block], walls: [Wall], isComplete: Bool) {
        self.blocks = blocks
        self.walls = walls
        self.isComplete = isComplete
    }
}
