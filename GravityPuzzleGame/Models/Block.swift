//
//  RedBlock.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit
struct Block {
    
    let colorReference: Int
    let propertiesReference: Int
    var startingPoint: CGPoint
    var goalPoint: CGPoint
    var blockSize: CGSize
    var isInPlace: Bool
}
