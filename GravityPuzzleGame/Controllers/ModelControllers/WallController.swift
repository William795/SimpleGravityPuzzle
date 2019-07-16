//
//  WallController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit

class WallController {
    
    static let shared = WallController()
    
    
    func makeWallWith(X: CGFloat, Y: CGFloat, size: CGSize) -> Wall {
        let wall = Wall(size: size, position: CGPoint(x: screenSize.maxX * X, y: screenSize.maxY * Y))
        
        return wall
    }
    
    func WallSize(widthMultiplyer: CGFloat, heightMultiplyer: CGFloat) -> CGSize {
        return CGSize(width: screenSize.width * widthMultiplyer, height: screenSize.height * heightMultiplyer)
    }
    
}
