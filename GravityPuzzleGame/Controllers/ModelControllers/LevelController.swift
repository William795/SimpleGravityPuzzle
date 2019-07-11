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
    
    func LevelSelect(int: Int) -> Level {
        switch int {
        case 1:
            return makeFirstLevel()
        default:
            return makeFirstLevel()
        }
    }
    
    func makeFirstLevel() -> Level {
        let level = Level(blocks: [], blockReference: [1], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        let blockPositionArray = [[presetCGPoint.bottomLeftCorner, presetCGPoint.topRightCornerEndPoint]]
        let finishedLevel = setUpLevel(level: level, blockPositionArray: blockPositionArray, walls: [])
        
        return finishedLevel
    }
    
    func makeSecondLevel() -> Level {
        let level = Level(blocks: [], blockReference: [1, 2], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        let blockPositions = [[presetCGPoint.middle, presetCGPoint.topRightCornerEndPoint],
                              [presetCGPoint.bottomLeftCorner, presetCGPoint.bottomRightCornerEndPoint]]
        
        let walls: [Wall] = [Wall(size: WallSizes.quarterHorizonalWall, position: presetCGPoint.topRightFourth),
                             Wall(size: WallSizes.fullHorizontalWall, position: presetCGPoint.bottomMiddleFourth)
        ]
        
        let finishedLevel = setUpLevel(level: level, blockPositionArray: blockPositions, walls: walls)
        
        return finishedLevel
    }
    
    func setUpLevel(level: Level, blockPositionArray: [[CGPoint]], walls: [Wall]) -> Level {
        let blockSize = CGSize(width: screenSize.width / 10 * level.levelSizeMultiplyer, height: screenSize.height / 20 * level.levelSizeMultiplyer)
        var loopCount = 0
        
        for posArray in blockPositionArray {
            let block = BlockController.shared.setUpBlock(blockStart: posArray[0], goalPoint: posArray[1], blockSize: blockSize, blockPropertyReferance: level.blockReference[loopCount])
            level.blocks.append(block)
            loopCount += 1
        }
        loopCount = 0
        
        for wall in walls {
            level.walls.append(wall)
        }
        return level
    }
    
    func makePackOneLevelArray() -> [Level] {
        let packOneArray = [makeFirstLevel(), makeSecondLevel(), makeFirstLevel(), makeSecondLevel(), makeFirstLevel(), makeSecondLevel(), makeFirstLevel(), makeSecondLevel(), makeFirstLevel(), makeSecondLevel(),]
        
        return packOneArray
    }
}
