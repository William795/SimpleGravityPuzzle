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
    
    func makeLevelOne() -> Level {
        var level = Level(blocks: [], blockReference: [1], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        let blockPositionArray = [[presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.topLeftCornerEndPoint]]
        setUpLevel(level: &level, blockPositionArray: blockPositionArray, walls: [])
        return level
    }
    
    func makeLevelTwo() -> Level {
        var level = Level(blocks: [], blockReference: [2,1], levelSizeMultiplyer: 1.9, walls: [], isComplete: false)
        
        let blockPositions = [[presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.bottomRightCornerEndPoint], [presetBlockCGPoint.topLeftCorner, presetBlockCGPoint.topRightCornerEndPoint]]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.5, Y: 0.55, size: WallSizes.fullHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.16, Y: 0.24, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.16, Y: 0.84, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.385, Y: 0.54, size: WallController.shared.WallSize(widthMultiplyer: 0.05, heightMultiplyer: 0.62)),
                             WallController.shared.makeWallWith(X: 0.65, Y: 0.2, size: WallSizes.quarterVerticalWall),
                             WallController.shared.makeWallWith(X: 0.65, Y: 0.9, size: WallSizes.quarterVerticalWall)
        ]
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        
        return level
    }
    
    func makeLevelThree() -> Level {
        var level = Level(blocks: [], blockReference: [1, 2], levelSizeMultiplyer: 2, walls: [], isComplete: false)
        let blockPositions = [[presetBlockCGPoint.middle, presetBlockCGPoint.topRightCornerEndPoint],
                              [presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.bottomRightCornerEndPoint]]
        
        let walls: [Wall] = [Wall(size: WallSizes.quarterHorizonalWall, position: presetWallPosition.topRightEightFour),
                             Wall(size: WallSizes.thickFullHorizontalWall, position: presetWallPosition.bottomMiddleFourth)
                             ]
        
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        return level
    }
    
    func makeLevelFour() -> Level {
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
    
    func makeLevelFive() -> Level {
        var level = Level(blocks: [], blockReference: [1, 3], levelSizeMultiplyer: 1.5, walls: [], isComplete: false)
        
        let blockPositions: [[CGPoint]] = [[presetBlockCGPoint.bottomRightCorner, presetBlockCGPoint.bottomLeftCornerEndPoint], BlockController.shared.setCustomBlockPosition(blockX: 0.4, blockY: 0.6, endX: 0.4, endY: 0.4)]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.4, Y: 0.5, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.27, Y: 0.35, size: WallSizes.fullVerticalWall),
                             WallController.shared.makeWallWith(X: 0.73, Y: 0.35, size: WallSizes.fullVerticalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.838, size: WallSizes.halfHorizontalWall)
        ]
        
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        
        return level
    }
    
    func makeLevelSix() -> Level {
        var level = Level(blocks: [], blockReference: [1,2,3], levelSizeMultiplyer: 1.5, walls: [], isComplete: false)
        
        let blockPositions: [[CGPoint]] = [BlockController.shared.setCustomBlockPosition(blockX: 0.1, blockY: 0.6, endX: 0.15, endY: 0.92), BlockController.shared.setCustomBlockPosition(blockX: 0.1, blockY: 0.5, endX: 0.15, endY: 0.16), [presetBlockCGPoint.bottomRightCorner, presetBlockCGPoint.topRightCornerEndPoint]]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.3, Y: 0.55, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.2, Y: 0.44, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.2, Y: 0.66, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.65, Y: 0.15, size: WallController.shared.WallSize(widthMultiplyer: 0.2, heightMultiplyer: 0.6)),
                             WallController.shared.makeWallWith(X: 0.65, Y: 0.95, size: WallController.shared.WallSize(widthMultiplyer: 0.2, heightMultiplyer: 0.6)),
                             WallController.shared.makeWallWith(X: 0.55, Y: 0.55, size: WallSizes.thickFullVerticalWall),
                             WallController.shared.makeWallWith(X: 0.9, Y: 0.55, size: WallSizes.quarterHorizonalWall)
        ]
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        
        return level
    }
    
    func makeLevelSeven() -> Level {
        var level = Level(blocks: [], blockReference: [2, 1, 3], levelSizeMultiplyer: 1.5, walls: [], isComplete: false)
        
        let blockPositions: [[CGPoint]] = [BlockController.shared.setCustomBlockPosition(blockX: 0.15, blockY: 0.9, endX: 0.4, endY: 0.4),
                                           BlockController.shared.setCustomBlockPosition(blockX: 0.85, blockY: 0.9, endX: 0.6, endY: 0.2),
                                           BlockController.shared.setCustomBlockPosition(blockX: 0.85, blockY: 0.2, endX: 0.85, endY: 0.3)
                                           ]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.13, Y: 0.86, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.87, Y: 0.86, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.5, size: WallSizes.fullVerticalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.55, size: WallController.shared.WallSize(widthMultiplyer: 0.4, heightMultiplyer: 0.03)),
                             WallController.shared.makeWallWith(X: 0.73, Y: 0.25, size: WallSizes.quarterVerticalWall),
                             WallController.shared.makeWallWith(X: 0.85, Y: 0.363, size: WallSizes.eighthHorizontalWall)
                             
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
        let packOneArray = [makeLevelOne(), makeLevelTwo(),  makeLevelThree(), makeLevelFour(), makeLevelFive(), makeLevelSix(), makeLevelSeven()]
        
        return packOneArray
    }
}
