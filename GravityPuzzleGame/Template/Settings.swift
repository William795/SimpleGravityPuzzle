//
//  Settings.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit

enum PhysicsCategorys {
    static let none: UInt32 = 0
    static let blockOne: UInt32 = 0x1
    static let endPointOne: UInt32 = 0x1 << 1
    static let blockTwo: UInt32 = 0x1 << 2
    static let endPointTwo: UInt32 = 0x1 << 3
    static let blockThree: UInt32 = 0x1 << 4
    static let endPointThree: UInt32 = 0x1 << 5
    static let blockFour: UInt32 = 0x1 << 6
    static let endPointFour: UInt32 = 0x1 << 7
    static let wall: UInt32 = 0x1 << 8
}

enum ZPosition {
    static let background: CGFloat = 0
    static let gameElements: CGFloat = 1
    static let label: CGFloat = 2
}

enum presetCGPoint {
    static let middle: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.midY)
    
    //MARK: - block and goal spots
    static let bottomLeftCorner: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6, y: screenSize.minY + screenSize.midY / 12)
    static let bottomLeftCornerEndPoint: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6 + screenSize.width / 15, y: screenSize.minY + screenSize.midY / 12 + screenSize.height / 30)
    
    static let bottomRightCorner: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6, y: screenSize.minY + screenSize.midY / 12)
    static let bottomRightCornerEndPoint: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6 - screenSize.width / 15, y: screenSize.minY + screenSize.midY / 12 + screenSize.height / 30)
    
    static let topLeftCorner: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6, y: screenSize.maxY - screenSize.midY / 12)
    static let topLeftCornerEndPoint: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6 + screenSize.width / 15, y: screenSize.maxY - screenSize.midY / 12 - screenSize.height / 30)
    
    static let topRightCorner: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6, y: screenSize.maxY - screenSize.midY / 12)
    static let topRightCornerEndPoint: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6 - screenSize.width / 15, y: screenSize.maxY - screenSize.midY / 12 - screenSize.height / 30)
    
    
    //MARK: - Wall Positions
    
    static let topRightFourth: CGPoint = CGPoint(x: screenSize.maxX * 0.75, y: screenSize.maxY * 0.75)
    
    static let bottomMiddleFourth: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.midY - screenSize.midY / 2)
}

enum WallSizes {
    //MARK: - Wall sizes
    
    static let wallFullCenterCross: [CGSize] = [CGSize(width: screenSize.width, height: screenSize.height / 30), CGSize(width: screenSize.width / 20, height: screenSize.height)]
    static let wallHalfCenterCross: [CGSize] = [CGSize(width: screenSize.width / 2, height: screenSize.height / 30), CGSize(width: screenSize.width / 20, height: screenSize.height / 2)]
    static let wallQuarterCenterCross: [CGSize] = [CGSize(width: screenSize.width / 4, height: screenSize.height / 40), CGSize(width: screenSize.width / 20, height: screenSize.height / 4)]
    
    static let fullHorizontalWall: CGSize = CGSize(width: screenSize.width, height: screenSize.height / 40)
    static let fullVerticalWall: CGSize = CGSize(width: screenSize.width / 20, height: screenSize.height)
    
    static let halfHorizontalWall: CGSize = CGSize(width: screenSize.width / 2, height: screenSize.height/40)
    static let halfVerticalWall: CGSize = CGSize(width: screenSize.width / 20, height: screenSize.height/2)
    
    static let quarterHorizonalWall: CGSize = CGSize(width: screenSize.width/4, height: screenSize.height/40)
    static let quarterVerticalWall: CGSize = CGSize(width: screenSize.width/20, height: screenSize.height/4)
    
}
