//
//  Level.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit

class Level {
    
    var blocks: [Block]
    let blockReference: [Int]
    let levelSizeMultiplyer: CGFloat
    var walls: [Wall]
    var isComplete: Bool
    
    init(blocks: [Block], blockReference: [Int], levelSizeMultiplyer: CGFloat, walls: [Wall], isComplete: Bool) {
        self.blocks = blocks
        self.blockReference = blockReference
        self.levelSizeMultiplyer = levelSizeMultiplyer
        self.walls = walls
        self.isComplete = isComplete
    }
}
