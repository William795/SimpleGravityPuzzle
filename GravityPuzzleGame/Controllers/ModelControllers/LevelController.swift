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
        var level = Level(blocks: [], blockReference: [1], levelSizeMultiplyer: 2, walls: [], isComplete: false, levelRef: 1)
        let blockPositionArray = [[presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.topLeftCornerEndPoint]]
        setUpLevel(level: &level, blockPositionArray: blockPositionArray, walls: [])
        return level
    }
    
    func makeLevelTwo() -> Level {
        var level = Level(blocks: [], blockReference: [2,1], levelSizeMultiplyer: 1.9, walls: [], isComplete: false, levelRef: 2)
        
        let blockPositions = [[presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.bottomRightCornerEndPoint], [presetBlockCGPoint.topLeftCorner, presetBlockCGPoint.topRightCornerEndPoint]]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.5, Y: 0.55, size: WallSizes.fullHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.16, Y: 0.25, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.16, Y: 0.84, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.385, Y: 0.54, size: WallController.shared.WallSize(widthMultiplyer: 0.05, heightMultiplyer: 0.6)),
                             WallController.shared.makeWallWith(X: 0.65, Y: 0.2, size: WallSizes.quarterVerticalWall),
                             WallController.shared.makeWallWith(X: 0.65, Y: 0.9, size: WallSizes.quarterVerticalWall)
        ]
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        return level
    }
    
    func makeLevelThree() -> Level {
        var level = Level(blocks: [], blockReference: [1, 2], levelSizeMultiplyer: 2, walls: [], isComplete: false, levelRef: 3)
        let blockPositions = [[presetBlockCGPoint.middle, presetBlockCGPoint.topRightCornerEndPoint],
                              [presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.bottomRightCornerEndPoint]]
        
        let walls: [Wall] = [Wall(size: WallSizes.quarterHorizonalWall, position: presetWallPosition.topRightEightFour),
                             Wall(size: WallSizes.thickFullHorizontalWall, position: presetWallPosition.bottomMiddleFourth)
                             ]
        
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        return level
    }
    
    func makeLevelFour() -> Level {
        var level = Level(blocks: [], blockReference: [1,2], levelSizeMultiplyer: 1.5, walls: [], isComplete: false, levelRef: 4)
        
        let blockPositions = [[presetBlockCGPoint.topRightCorner, presetBlockCGPoint.bottomRightCornerEndPoint], [presetBlockCGPoint.topLeftCorner, presetBlockCGPoint.leftMinBottomFourthEndPoint]]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.5, Y: 0.5, size: WallSizes.fullVerticalWall),
                             WallController.shared.makeWallWith(X: 0.15, Y: 0.85, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.85, Y: 0.85, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.6, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.18, Y: 0.35, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.28, Y: 0.29, size: WallSizes.eighthVerticalWall)
                             ]
        
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        return level
    }
    
    func makeLevelFive() -> Level {
        var level = Level(blocks: [], blockReference: [1, 3], levelSizeMultiplyer: 1.5, walls: [], isComplete: false, levelRef: 5)
        
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
        var level = Level(blocks: [], blockReference: [1,2,3], levelSizeMultiplyer: 1.5, walls: [], isComplete: false, levelRef: 6)
        
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
        var level = Level(blocks: [], blockReference: [2, 1, 3], levelSizeMultiplyer: 1.5, walls: [], isComplete: false, levelRef: 7)
        
        let blockPositions: [[CGPoint]] = [BlockController.shared.setCustomBlockPosition(blockX: 0.15, blockY: 0.9, endX: 0.38, endY: 0.485),
                                           BlockController.shared.setCustomBlockPosition(blockX: 0.85, blockY: 0.9, endX: 0.615, endY: 0.175),
                                           BlockController.shared.setCustomBlockPosition(blockX: 0.85, blockY: 0.2, endX: 0.84, endY: 0.31)
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
    
    func makeLevelEight() -> Level {
        var level = Level(blocks: [], blockReference: [1, 4], levelSizeMultiplyer: 1.5, walls: [], isComplete: false, levelRef: 8)
        
        let blockPositions: [[CGPoint]] = [[presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.topLeftCornerEndPoint], BlockController.shared.setCustomBlockPosition(blockX: 0.6, blockY: 0.15, endX: 0.6, endY: 0.92)]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.5, Y: 0.5, size: WallSizes.fullVerticalWall),
                             WallController.shared.makeWallWith(X: 0.39, Y: 0.25, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.85, Y: 0.25, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.39, Y: 0.6, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.85, Y: 0.6, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.0, Y: 0.42, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.61, Y: 0.42, size: WallSizes.quarterHorizonalWall),
                             WallController.shared.makeWallWith(X: 0.0, Y: 0.75, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.61, Y: 0.75, size: WallSizes.quarterHorizonalWall)
                             ]
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        return level
    }
    
    func makeLevelNine() -> Level {
        var level = Level(blocks: [], blockReference: [1, 2, 4], levelSizeMultiplyer: 1.4, walls: [], isComplete: false, levelRef: 9)
        
        let blockPositions: [[CGPoint]] = [BlockController.shared.setCustomBlockPosition(blockX: 0.9, blockY: 0.7, endX: 0.17, endY: 0.91), BlockController.shared.setCustomBlockPosition(blockX: 0.9, blockY: 0.3, endX: 0.17, endY: 0.27),[presetBlockCGPoint.bottomLeftCorner, presetBlockCGPoint.bottomRightCornerEndPoint]]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0.5, Y: 0.22, size: WallSizes.fullHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.6, size: WallSizes.fullHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.6, size: WallSizes.thinHalfVerticalWall),
                             WallController.shared.makeWallWith(X: 0.72, Y: 0.35, size: WallSizes.thinQuarterVerticalWall),
                             WallController.shared.makeWallWith(X: 0.28, Y: 0.35, size: WallSizes.thinQuarterVerticalWall),
                             WallController.shared.makeWallWith(X: 0.95, Y: 0.75, size: WallSizes.thinHalfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.615, Y: 0.845, size: WallSizes.thinQuarterHorizonalWall)
                             ]
        setUpLevel(level: &level, blockPositionArray: blockPositions, walls: walls)
        return level
    }
    
    func makeLevelTen() -> Level {
        var level = Level(blocks: [], blockReference: [1, 2, 3, 4], levelSizeMultiplyer: 1.2, walls: [], isComplete: false, levelRef: 10)
        
        let blockPositions: [[CGPoint]] = [BlockController.shared.setCustomBlockPosition(blockX: 0.15, blockY: 0.85, endX: 0.4, endY: 0.6), BlockController.shared.setCustomBlockPosition(blockX: 0.85, blockY: 0.85, endX: 0.6, endY: 0.6), BlockController.shared.setCustomBlockPosition(blockX: 0.15, blockY: 0.15, endX: 0.4, endY: 0.5), BlockController.shared.setCustomBlockPosition(blockX: 0.85, blockY: 0.15, endX: 0.6, endY: 0.5)]
        let walls: [Wall] = [WallController.shared.makeWallWith(X: 0, Y: 0.8, size: WallSizes.thinHalfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.25, Y: 0.8335, size: WallController.shared.WallSize(widthMultiplyer: 0.03, heightMultiplyer: 0.08)),
                             WallController.shared.makeWallWith(X: 1, Y: 0.8, size: WallSizes.thinHalfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.75, Y: 0.8335, size: WallController.shared.WallSize(widthMultiplyer: 0.03, heightMultiplyer: 0.08)),
                             WallController.shared.makeWallWith(X: 0.61, Y: 0.7, size: WallSizes.thinEighthHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.55, size: WallSizes.fullHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.5, Y: 0.55, size: WallSizes.fullVerticalWall),
                             WallController.shared.makeWallWith(X: 0.05, Y: 0.4, size: WallSizes.halfHorizontalWall),
                             WallController.shared.makeWallWith(X: 0.28, Y: 0.42, size: WallSizes.quarterVerticalWall),
                             WallController.shared.makeWallWith(X: 1, Y: 0.23, size: WallSizes.thinHalfHorizontalWall)
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
        let packOneArray = [makeLevelOne(), makeLevelTwo(),  makeLevelThree(), makeLevelFour(), makeLevelFive(), makeLevelSix(), makeLevelSeven(), makeLevelEight(), makeLevelNine(), makeLevelTen()]
        return packOneArray
    }
}
