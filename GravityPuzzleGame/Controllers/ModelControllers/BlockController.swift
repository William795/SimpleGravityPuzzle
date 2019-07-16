//
//  BlockController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/9/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit

class BlockController {
    
    static let shared = BlockController()
    
    //MARK: Blocks
    
    let redBlockTemplate = Block(colorReference: 1, propertiesReference: 1, startingPoint: CGPoint(x: 110, y: 100), goalPoint: CGPoint(x: 0, y: 0), blockSize: CGSize(width: 0, height: 0), isInPlace: false)
    let blueBlockTemplate = Block(colorReference: 2, propertiesReference: 2, startingPoint: CGPoint(x: 110, y: 100), goalPoint: CGPoint(x: 0, y: 0), blockSize: CGSize(width: 0, height: 0), isInPlace: false)
    let yellowBlocktemplate = Block(colorReference: 3, propertiesReference: 3, startingPoint: CGPoint(x: 110, y: 100), goalPoint: CGPoint(x: 0, y: 0), blockSize: CGSize(width: 0, height: 0), isInPlace: false)
    //MARK: pack 1 levels block placement
    
    func setUpBlock(blockStart: CGPoint, goalPoint: CGPoint, blockSize: CGSize, blockPropertyReferance: Int) -> Block  {
        
        var block = identifyBlock(blockRef: blockPropertyReferance)
        block.blockSize = blockSize
        block.startingPoint = blockStart
        block.goalPoint = goalPoint
        
        return block
    }
    
    func setCustomBlockPosition(blockX: CGFloat, blockY: CGFloat, endX: CGFloat, endY: CGFloat) -> [CGPoint] {
        let blockPosition = CGPoint(x: screenSize.maxX * blockX, y: screenSize.maxY * blockY)
        let endPosition = CGPoint(x: screenSize.maxX * endX, y: screenSize.maxY * endY)
    
        return [blockPosition, endPosition]
    }
    
    func identifyBlock(blockRef: Int) -> Block {
        switch blockRef {
        case 1:
            return redBlockTemplate
        case 2:
            return blueBlockTemplate
        case 3:
            return yellowBlocktemplate
        default:
            return redBlockTemplate
        }
    }
}
