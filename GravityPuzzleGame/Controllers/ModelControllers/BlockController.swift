//
//  BlockController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/9/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit

class BlockController {
    
    //MARK: Blocks
    
    let redBlockTemplate = Block(colorReference: 1, propertiesReference: 1, startingPoint: CGPoint(x: 110, y: 100), goalPoint: CGPoint(x: 0, y: 0), blockSize: CGSize(width: 0, height: 0), isInPlace: false)
    let blueBlockTemplate = Block(colorReference: 2, propertiesReference: 2, startingPoint: CGPoint(x: 110, y: 100), goalPoint: CGPoint(x: 0, y: 0), blockSize: CGSize(width: 0, height: 0), isInPlace: false)
    
    //MARK: pack 1 levels block placement
    
    func setUpBlockPosition(blockStart: CGPoint, goalPoint: CGPoint, blockSize: CGSize, blocksPropertyReferance: Int)  {
        
        let redBlock = redBlockTemplate
        redBlock.blockSize = blockSize
        redBlock.startingPoint = blockStart
        redBlock.goalPoint = goalPoint
        
        
    }
}
