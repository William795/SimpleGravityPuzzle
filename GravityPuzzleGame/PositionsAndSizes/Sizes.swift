//
//  Sizes.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/15/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit


enum WallSizes {
    //MARK: - Wall sizes
    
    static let wallFullCenterCross: [CGSize] = [CGSize(width: screenSize.width, height: screenSize.height / 30), CGSize(width: screenSize.width / 20, height: screenSize.height)]
    static let wallHalfCenterCross: [CGSize] = [CGSize(width: screenSize.width / 2, height: screenSize.height / 30), CGSize(width: screenSize.width / 20, height: screenSize.height / 2)]
    static let wallQuarterCenterCross: [CGSize] = [CGSize(width: screenSize.width / 4, height: screenSize.height / 40), CGSize(width: screenSize.width / 20, height: screenSize.height / 4)]
    
    static let fullHorizontalWall: CGSize = CGSize(width: screenSize.width, height: screenSize.height / 40)
    static let fullVerticalWall: CGSize = CGSize(width: screenSize.width / 20, height: screenSize.height)
    
    static let halfHorizontalWall: CGSize = CGSize(width: screenSize.width / 2, height: screenSize.height/40)
    static let halfVerticalWall: CGSize = CGSize(width: screenSize.width / 20, height: screenSize.height/2)
    
    static let thirdHorizontalWall: CGSize = CGSize(width: screenSize.width / 3, height: screenSize.height/40)
    static let thirdVerticalWall: CGSize = CGSize(width: screenSize.width / 20, height: screenSize.height/3)
    
    static let quarterHorizonalWall: CGSize = CGSize(width: screenSize.width/4, height: screenSize.height/40)
    static let quarterVerticalWall: CGSize = CGSize(width: screenSize.width/20, height: screenSize.height/4)
    
    static let eighthVerticalWall: CGSize = CGSize(width: screenSize.width / 20, height: screenSize.height / 8)
    static let eighthHorizontalWall: CGSize = CGSize(width: screenSize.width / 4, height: screenSize.height / 40)
    
    static let thinFullHorizontalWall: CGSize = CGSize(width: screenSize.width, height: screenSize.height / 40)
    static let thinFullVerticalWall: CGSize = CGSize(width: screenSize.width / 20, height: screenSize.height)
    
    static let thinHalfHorizontalWall: CGSize = CGSize(width: screenSize.width / 2, height: screenSize.height/80)
    static let thinHalfVerticalWall: CGSize = CGSize(width: screenSize.width / 40, height: screenSize.height/2)
    
    static let thinThirdHorizontalWall: CGSize = CGSize(width: screenSize.width / 3, height: screenSize.height/80)
    static let thinThirdVerticalWall: CGSize = CGSize(width: screenSize.width / 40, height: screenSize.height/3)
    
    static let thinQuarterHorizonalWall: CGSize = CGSize(width: screenSize.width/4, height: screenSize.height/80)
    static let thinQuarterVerticalWall: CGSize = CGSize(width: screenSize.width/40, height: screenSize.height/4)
    
    static let thinEighthVerticalWall: CGSize = CGSize(width: screenSize.width / 40, height: screenSize.height / 8)
    static let thinEighthHorizontalWall: CGSize = CGSize(width: screenSize.width / 4, height: screenSize.height / 80)
    
    static let thickWallFullCenterCross: [CGSize] = [CGSize(width: screenSize.width, height: screenSize.height / 20), CGSize(width: screenSize.width / 15, height: screenSize.height)]
    static let thickWallHalfCenterCross: [CGSize] = [CGSize(width: screenSize.width / 2, height: screenSize.height / 20), CGSize(width: screenSize.width / 15, height: screenSize.height / 2)]
    static let thickWallQuarterCenterCross: [CGSize] = [CGSize(width: screenSize.width / 4, height: screenSize.height / 20), CGSize(width: screenSize.width / 10, height: screenSize.height / 4)]
    
    static let thickFullHorizontalWall: CGSize = CGSize(width: screenSize.width, height: screenSize.height / 20)
    static let thickFullVerticalWall: CGSize = CGSize(width: screenSize.width / 10, height: screenSize.height)
    
    static let thickHalfHorizontalWall: CGSize = CGSize(width: screenSize.width / 2, height: screenSize.height/20)
    static let thickHalfVerticalWall: CGSize = CGSize(width: screenSize.width / 10, height: screenSize.height/2)
    
    static let thickQuarterHorizonalWall: CGSize = CGSize(width: screenSize.width/4, height: screenSize.height/20)
    static let thickQuarterVerticalWall: CGSize = CGSize(width: screenSize.width/10, height: screenSize.height/4)
    
}

