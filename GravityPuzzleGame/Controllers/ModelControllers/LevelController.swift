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
        var level = Level(blocks: [], blockReference: [1], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        let blockPositionArray = [[presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.topLeftCornerEndPoint]]
        setUpLevel(level: &level, blockPositionArray: blockPositionArray, walls: [])
        return level
    }
    
    func makeSecondLevel() -> Level {
        var level = Level(blocks: [], blockReference: [1, 2], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        let blockPositions = [[presetBlockCGPoint.middle, presetBlockCGPoint.topRightCornerEndPoint],
                              [presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.bottomRightCornerEndPoint]]
        
        let walls: [Wall] = [Wall(size: WallSizes.quarterHorizonalWall, position: presetWallPosition.topRightEightFour),
                             Wall(size: WallSizes.thickFullHorizontalWall, position: presetWallPosition.bottomMiddleFourth)
                             ]
        
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        return level
    }
    
    func makeThirdLevel() -> Level {
    var level = Level(blocks: [], blockReference: [1,2], levelSizeMultiplyer: 1.5, walls: [], isComplete: false)
        
        let blockPositions = [[presetBlockCGPoint.topRightCorner, presetBlockCGPoint.bottomRightCornerEndPoint], [presetBlockCGPoint.topLeftCorner, presetBlockCGPoint.leftMinBottomFourthEndPoint]]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.5, Y: 0.5, size: WallSizes.fullVerticalWall),
                             WallController.shared.makeWallWith(X: 0.15, Y: 0.85, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.85, Y: 0.85, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.6, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.18, Y: 0.35, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.28, Y: 0.3, size: WallSizes.eighthVerticalWall)
                             ]
        
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        return level
    }
    
    func makeFourthLevel() -> Level {
        var level = Level(blocks: [], blockReference: [1,2], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        
        let blockPositions = [[presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.bottomRightCornerEndPoint], [presetBlockCGPoint.topLeftCorner, presetBlockCGPoint.topRightCornerEndPoint]]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.5, Y: 0.5, size: WallSizes.fullHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.16, Y: 0.24, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.16, Y: 0.84, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.385, Y: 0.54, size: WallController.shared.WallSize(widthMultiplyer: 0.05, heightMultiplyer: 0.62)),
                             WallController.shared.makeWallWith(X: 0.65, Y: 0.2, size: WallSizes.quarterVerticalWall),
                             WallController.shared.makeWallWith(X: 0.65, Y: 0.9, size: WallSizes.quarterVerticalWall)
                             ]
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        
        return level
    }
    
    private func setUpLevel(level: inout Level, blockPositionArray: [[CGPoint]], walls: [Wall]) {
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
    }
    
    func makePackOneLevelArray() -> [Level] {
        let packOneArray = [makeFirstLevel(), makeSecondLevel(), makeFourthLevel(), makeThirdLevel()]
        
        return packOneArray
    }
}
