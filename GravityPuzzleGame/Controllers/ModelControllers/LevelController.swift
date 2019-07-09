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
    
//    let levelOne = Level(blocks: <#T##[Block]#>, walls: <#T##[Wall]#>, isComplete: <#T##Bool#>)
    
    func setUpLevel(_: Level) -> Level {
        let size = CGSize(width: 50, height: 50)
        var level = Level(blocks: [], walls: [], isComplete: false)
        
        let blockOne = BlockController.shared.setUpBlock(blockStart: CGPoint(x: screenSize.midX, y: screenSize.midY), goalPoint: CGPoint(x: screenSize.maxX - 50, y: screenSize.maxY - 70), blockSize: size, blockPropertyReferance: 1)
        
        level.blocks.append(blockOne)
        
        return level
    }
}
