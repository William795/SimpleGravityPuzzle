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
    static let topRightEightFour: CGPoint = CGPoint(x: screenSize.maxX * 0.84, y: screenSize.maxY * 0.84)
    static let bottomMiddleFourth: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.midY - screenSize.midY / 2.1)
}
