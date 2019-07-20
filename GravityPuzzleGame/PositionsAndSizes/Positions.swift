//
//  Positions.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/15/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit


enum presetBlockCGPoint {
    static let middle: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.midY)
    
    //MARK: - block and goal spots
    static let bottomLeftCorner: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6, y: screenSize.minY + screenSize.midY / 3)
    static let bottomLeftCornerEndPoint: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6 + screenSize.width / 15, y: screenSize.minY + screenSize.midY / 12 + screenSize.height / 8.5)
    
    static let bottomRightCorner: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6, y: screenSize.minY + screenSize.midY / 3)
    static let bottomRightCornerEndPoint: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6 - screenSize.width / 15, y: screenSize.minY + screenSize.midY / 12 + screenSize.height / 8.5)
    
    static let topLeftCorner: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6, y: screenSize.maxY - screenSize.midY / 12)
    static let topLeftCornerEndPoint: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 3, y: screenSize.maxY - screenSize.midY / 12 - screenSize.height / 30)
    
    static let topRightCorner: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6, y: screenSize.maxY - screenSize.midY / 12)
    static let topRightCornerEndPoint: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6 - screenSize.width / 15, y: screenSize.maxY - screenSize.midY / 12 - screenSize.height / 30)
    
    static let leftMinBottomFourthEndPoint: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 3, y: screenSize.minY + screenSize.midY / 1.7)
    
    
    
}

//MARK: - Wall Positions
enum presetWallPosition {
    static let middle: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.midY)
    
    static let topRightSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.7, y: screenSize.maxY * 0.7)
    static let topRightEight: CGPoint = CGPoint(x: screenSize.maxX * 0.8, y: screenSize.maxY * 0.8)
    static let topRightEightFour: CGPoint = CGPoint(x: screenSize.maxX * 0.84, y: screenSize.maxY * 0.84)
    static let topRightNine: CGPoint = CGPoint(x: screenSize.maxX * 0.9, y: screenSize.maxY * 0.9)
    
    static let topMiddleSeven: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.maxY * 0.7)
    static let topMiddleEight: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.maxY * 0.8)
    static let topMiddleEightFour: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.maxY * 0.84)
    static let topMiddleNine: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.maxY * 0.9)
    
    static let topLeftSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.7)
    static let topLeftEight: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.8)
    static let topLeftEightFour: CGPoint = CGPoint(x: screenSize.maxX * 0.16, y: screenSize.maxY * 0.84)
    static let topLeftNine: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.9)
    
    static let bottomLeftSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.3)
    static let bottomLeftEight: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.2)
    static let bottomLeftEightFour: CGPoint = CGPoint(x: screenSize.maxX * 0.16, y: screenSize.maxY * 0.16)
    static let bottomLeftNine: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.1)
    
    static let bottomMiddleSeven: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.maxY * 0.7)
    static let bottomMiddleEight: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.maxY * 0.8)
    static let bottomMiddleEightFour: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.maxY * 0.84)
    static let bottomMiddleNine: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.maxY * 0.9)
    
    static let bottomRightSix: CGPoint = CGPoint(x: screenSize.maxX * 0.6, y: screenSize.maxY * 0.4)
    static let bottomRightSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.7, y: screenSize.maxY * 0.3)
    static let bottomRightEight: CGPoint = CGPoint(x: screenSize.maxX * 0.8, y: screenSize.maxY * 0.2)
    static let bottomRightEightFour: CGPoint = CGPoint(x: screenSize.maxX * 0.84, y: screenSize.maxY * 0.16)
   
    static let bottomMiddleFourth: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.midY - screenSize.midY / 2)
}
