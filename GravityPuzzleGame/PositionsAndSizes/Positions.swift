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
    static let bottomLeftCorner: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6, y: screenSize.minY + screenSize.midY / 4)
    static let bottomLeftCornerEndPoint: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6 + screenSize.width / 15, y: screenSize.minY + screenSize.midY / 12 + screenSize.height / 8.5)
    
    static let bottomRightCorner: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6, y: screenSize.minY + screenSize.midY / 4)
    static let bottomRightCornerEndPoint: CGPoint = CGPoint(x: screenSize.maxX - screenSize.midX / 6 - screenSize.width / 15, y: screenSize.minY + screenSize.midY / 12 + screenSize.height / 8.5)
    
    static let topLeftCorner: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 6, y: screenSize.maxY - screenSize.midY / 12)
    static let topLeftCornerEndPoint: CGPoint = CGPoint(x: screenSize.minX + screenSize.midX / 4, y: screenSize.maxY - screenSize.midY / 12 - screenSize.height / 30)
    
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
    
    static let zeroTen: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY)
    static let zeroNine: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.9)
    static let zeroEight: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.8)
    static let zeroSeven: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.7)
    static let zeroSix: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.6)
    static let zeroFive: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.5)
    static let zeroFour: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.4)
    static let zeroThree: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.3)
    static let zeroTwo: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.2)
    static let zeroOne: CGPoint = CGPoint(x: screenSize.maxX * 0, y: screenSize.maxY * 0.1)
    
    static let oneTen: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY)
    static let oneNine: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.9)
    static let oneEight: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.8)
    static let oneSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.7)
    static let oneSix: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.6)
    static let oneFive: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.5)
    static let oneFour: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.4)
    static let oneThree: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.3)
    static let oneTwo: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.2)
    static let oneOne: CGPoint = CGPoint(x: screenSize.maxX * 0.1, y: screenSize.maxY * 0.1)
    
    static let twoTen: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY)
    static let twoNine: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.9)
    static let twoEight: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.8)
    static let twoSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.7)
    static let twoSix: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.6)
    static let twoFive: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.5)
    static let twoFour: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.4)
    static let twoThree: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.3)
    static let twoTwo: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.2)
    static let twoOne: CGPoint = CGPoint(x: screenSize.maxX * 0.2, y: screenSize.maxY * 0.1)

    static let threeTen: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY)
    static let threeNine: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.9)
    static let threeEight: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.8)
    static let threeSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.7)
    static let threeSix: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.6)
    static let threeFive: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.5)
    static let threeFour: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.4)
    static let threeThree: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.3)
    static let threeTwo: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.2)
    static let threeOne: CGPoint = CGPoint(x: screenSize.maxX * 0.3, y: screenSize.maxY * 0.1)
    
    static let fourTen: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY)
    static let fourNine: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.9)
    static let fourEight: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.8)
    static let fourSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.7)
    static let fourSix: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.6)
    static let fourFive: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.5)
    static let fourFour: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.4)
    static let fourThree: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.3)
    static let fourTwo: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.2)
    static let fourOne: CGPoint = CGPoint(x: screenSize.maxX * 0.4, y: screenSize.maxY * 0.1)
    
    static let fiveTen: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY)
    static let fiveNine: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.9)
    static let fiveEight: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.8)
    static let fiveSeven: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.7)
    static let fiveSix: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.6)
    static let fiveFive: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.5)
    static let fiveFour: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.4)
    static let fiveThree: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.3)
    static let fiveTwo: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.2)
    static let fiveOne: CGPoint = CGPoint(x: screenSize.maxX * 0.5, y: screenSize.maxY * 0.1)

    static let bottomMiddleFourth: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.midY - screenSize.midY / 2)
}
