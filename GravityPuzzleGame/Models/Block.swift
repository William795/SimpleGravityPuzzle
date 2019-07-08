//
//  RedBlock.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit
class Block {
    
    let colorReference: Int
    let propertiesReference: Int
    let startingPoint: CGPoint
    let goalPoint: CGPoint
    var isInPlace: Bool
    
    init(colorReference: Int, propertiesReference: Int, startingPoint: CGPoint, goalPoint: CGPoint, isInPlace: Bool) {
        self.colorReference = colorReference
        self.propertiesReference = propertiesReference
        self.startingPoint = startingPoint
        self.goalPoint = goalPoint
        self.isInPlace = isInPlace
    }
}
