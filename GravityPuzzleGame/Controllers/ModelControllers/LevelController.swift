//
//  LevelController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/9/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit

class LevelController {
    
    static let shared = LevelController()
    
    //MARK: Pack 1
    
    func makeFirstLevel() -> Level {
        let level = Level(blocks: [], blockReference: [1], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        let blockPositionArray = [[SpecificCGPoint.bottomLeftCorner, SpecificCGPoint.topRightCornerEndPoint]]
        let finishedLevel = setUpLevel(level: level, blockPositionArray: blockPositionArray, wallPositionArray: [], wallSizeArray: [])
        
        return finishedLevel
    }
    
    func makeSecondLevel() -> Level {
        let level = Level(blocks: [], blockReference: [1, 2], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        let blockPositions = [[SpecificCGPoint.middle, SpecificCGPoint.topRightCornerEndPoint],
                              [SpecificCGPoint.bottomLeftCorner, SpecificCGPoint.bottomRightCornerEndPoint]]
        let wallPositions = [CGPoint(x: screenSize.midX, y: screenSize.height / 4),
                             CGPoint(x: screenSize.midX + screenSize.midX / 2, y: screenSize.maxY * 0.66)]
        let wallSizes = [CGSize(width: screenSize.width, height: screenSize.height / 10 * level.levelSizeMultiplyer),
                         CGSize(width: screenSize.width * 0.66, height: screenSize.height / 40 * level.levelSizeMultiplyer)]
        let finishedLevel = setUpLevel(level: level, blockPositionArray: blockPositions, wallPositionArray: wallPositions, wallSizeArray: wallSizes)
        
        return finishedLevel
    }
    
    func setUpLevel(level: Level, blockPositionArray: [[CGPoint]], wallPositionArray: [CGPoint], wallSizeArray: [CGSize]) -> Level {
        let blockSize = CGSize(width: screenSize.width / 10 * level.levelSizeMultiplyer, height: screenSize.height / 20 * level.levelSizeMultiplyer)
        var loopCount = 0
        
        for posArray in blockPositionArray {
            let block = BlockController.shared.setUpBlock(blockStart: posArray[0], goalPoint: posArray[1], blockSize: blockSize, blockPropertyReferance: level.blockReference[loopCount])
            level.blocks.append(block)
            loopCount += 1
        }
        loopCount = 0
        
        for pos in wallPositionArray {
            let wall = Wall(size: wallSizeArray[loopCount], position: pos)
            level.walls.append(wall)
            loopCount += 1
        }
        
        
        return level
    }
    
}
