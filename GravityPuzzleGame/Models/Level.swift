//
//  Level.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit

struct Level {
    
    var blocks: [Block]
    let blockReference: [Int]
    let levelSizeMultiplyer: CGFloat
    var walls: [Wall]
    var isComplete: Bool
    let levelRef: Int
}
