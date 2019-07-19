//
//  ParticleScene.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/19/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit

class ParticleScene: SKScene {

    var particleSystem: SKEmitterNode?
    var blockRef: Int?
    var pauseTimer = 0
    
    override func didMove(to view: SKView) {
        layoutScene()
    }
    
    func layoutScene() {
        switch blockRef {
        case 1:
            makeRedBlocks()
        case 2:
            makeBlueBlocks()
        case 3:
            makeYellowBlocks()
        case 4:
            makeGreenBlocks()
        default:
            makeRedBlocks()
        }
    }
    
    func makeRedBlocks() {
        particleSystem = SKEmitterNode(fileNamed: "RedBlock")
        particleSystem?.position = CGPoint(x: screenSize.minX - screenSize.midX / 2, y: screenSize.midY)
        scene?.addChild(particleSystem!)
    }
    
    func makeBlueBlocks() {
        particleSystem = SKEmitterNode(fileNamed: "BlueBlock")
        particleSystem?.position = CGPoint(x: screenSize.maxX + screenSize.midX / 2, y: screenSize.midY)
        scene?.addChild(particleSystem!)
    }
    
    func makeYellowBlocks() {
        particleSystem = SKEmitterNode(fileNamed: "YellowBlock")
        particleSystem?.position = CGPoint(x: screenSize.midX, y: screenSize.minY - screenSize.midY / 2)
        scene?.addChild(particleSystem!)
    }
    
    func makeGreenBlocks() {
        particleSystem = SKEmitterNode(fileNamed: "GreenBlock")
        particleSystem?.position = CGPoint(x: screenSize.midX, y: screenSize.maxY + screenSize.midY / 2)
        scene?.addChild(particleSystem!)
        
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            timer.tolerance = 0.2
            if self.isPaused {
                self.isPaused = false
                self.pauseTimer = 0
            } else if self.pauseTimer == 1 {
                self.isPaused = true
            } else {
                self.pauseTimer += 1
            }
        }
    }
}
