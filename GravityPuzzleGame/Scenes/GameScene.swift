//
//  GameScene.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //level object that sets up the scene
    var level: Level?
    
    var gameWon = false
    
    
    //MARK: Scene Set Up
    override func didMove(to view: SKView) {
        
        var blockArray = [Block(colorReference: 1, propertiesReference: 1, startingPoint: CGPoint(x: frame.midX, y: frame.midY), goalPoint: CGPoint(x: frame.midX, y: frame.midY + 50), isInPlace: false)]
        let wallArray = [Wall(size: CGSize(width: 20, height: 200), position: CGPoint(x: frame.midX, y: 200)), Wall(size: CGSize(width: 200, height: 20), position: CGPoint(x: 150, y: frame.midY))]
        level = Level(blocks: blockArray, walls: wallArray, isComplete: false)
        
        setUpPhysics()
        levelSetUp()
    }
    
    func setUpPhysics() {
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -10.0)
    }
    
    func levelSetUp() {
        setUpWalls()
        setUpBlocks()
    }
    
    func setUpWalls() {
        perimeterSetUp()
        for wall in level?.walls ?? [] {
            makeWallFrom(size: wall.size, position: wall.position)
        }
    }
    
    //MARK: Block SetUp
    
    func setUpBlocks() {
        var blockNumber = 1
        for block in level?.blocks ?? [] {
            makeBlock(startPosition: block.startingPoint, colorRef: block.colorReference, propertyRef: block.propertiesReference, blockID: blockNumber)
            makeEndPoint(endPosition: block.goalPoint, endPointID: blockNumber, colorRef: block.colorReference)
            block.isInPlace = false
            blockNumber += 1
        }
    }
    
    func makeBlock(startPosition: CGPoint, colorRef: Int, propertyRef: Int, blockID: Int) {
        let size = CGSize(width: 50, height: 50)
        let block = SKSpriteNode(color: getBlockColor(colorRef: colorRef), size: size)
        block.position = startPosition
        block.zPosition = ZPosition.gameElements
        block.physicsBody = SKPhysicsBody(rectangleOf: size)
        block.physicsBody?.collisionBitMask = PhysicsCategorys.wall
        
        blockPhysicsBody(sprite: block, ID: blockID)
        
        addChild(block)
    }
    
    func getBlockColor(colorRef: Int) -> UIColor {
        var color = UIColor(ciColor: .red)
        switch colorRef {
        case 1:
            color = .red
        case 2:
            color = .blue
        case 3:
            color = .yellow
        case 4:
            color = .green
        default:
            color = .red
        }
        return color
    }
    
    func blockPhysicsBody(sprite: SKSpriteNode, ID: Int) {
        switch ID {
        case 1:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockOne
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.endPointOne
        case 2:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockTwo
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.endPointTwo
        case 3:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockThree
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.endPointThree
        case 4:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockFour
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.endPointFour
        default:
            return
        }
    }
    
    //MARK: EndPoint set up
    
    func makeEndPoint(endPosition: CGPoint, endPointID: Int, colorRef: Int) {
        let size = CGSize(width: 50, height: 50)
        let goal = SKSpriteNode(color: getBlockColor(colorRef: colorRef), size: size)
        goal.position = endPosition
        goal.zPosition = ZPosition.gameElements
        goal.physicsBody = SKPhysicsBody(rectangleOf: size)
        endPointCategoryBitmask(sprite: goal, ID: endPointID)
        goal.physicsBody?.isDynamic = false
        
        addChild(goal)
    }
    
    func endPointCategoryBitmask(sprite: SKSpriteNode, ID: Int) {
        switch ID {
        case 1:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointOne
        case 2:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointTwo
        case 3:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointThree
        case 4:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointFour
        default:
            return
        }
    }
    
    
    //MARK: Wall Set Up
    
    func makeWallFrom(size: CGSize, position: CGPoint) {
        let wall = SKSpriteNode(color: .gray, size: size)
        wall.position = position
        wall.zPosition = ZPosition.gameElements
        wall.physicsBody = SKPhysicsBody(rectangleOf: size)
        wall.physicsBody?.categoryBitMask = PhysicsCategorys.wall
        wall.physicsBody?.isDynamic = false
        
        addChild(wall)
    }
    
    func perimeterSetUp() {
        let leftSide = CGPoint(x: frame.minX, y: frame.midY)
        let leftSize = CGSize(width: 50, height: frame.size.height)
        makePerimeterWall(side: leftSide, size: leftSize)
        
        let rightSide = CGPoint(x: frame.maxX, y: frame.midY)
        let rightSize = CGSize(width: 50, height: frame.size.height)
        makePerimeterWall(side: rightSide, size: rightSize)
        
        let topSide = CGPoint(x: frame.midX, y: frame.maxY)
        let topSize = CGSize(width: frame.size.width, height: 70)
        makePerimeterWall(side: topSide, size: topSize)
        
        let bottomSide = CGPoint(x: frame.midX, y: frame.minY)
        let bottomSize = CGSize(width: frame.size.width, height: 70)
        makePerimeterWall(side: bottomSide, size: bottomSize)
    }
    
    func makePerimeterWall(side: CGPoint, size: CGSize) {
        let wall = SKSpriteNode(color: .gray, size: size)
        wall.position = side
        wall.zPosition = ZPosition.gameElements
        wall.physicsBody = SKPhysicsBody(rectangleOf: size)
        wall.physicsBody?.categoryBitMask = PhysicsCategorys.wall
        wall.physicsBody?.isDynamic = false
        
        addChild(wall)
    }
    
    //MARK: Touch Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            self.spawnBall(point: touch.location(in: self))
        }
    }
    
    func spawnBall(point: CGPoint) {
        let ball = SKSpriteNode(color: .red, size: CGSize(width: 30.0, height: 30.0))
        ball.size = CGSize(width: 30.0, height: 30.0)
        ball.colorBlendFactor = 1.0
        ball.name = "Ball"
        ball.position = point
        ball.zPosition = ZPosition.label
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = PhysicsCategorys.blockOne
        ball.physicsBody?.contactTestBitMask = PhysicsCategorys.wall
        ball.physicsBody?.collisionBitMask = PhysicsCategorys.wall
        addChild(ball)
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    
    //MARK: Contact Funtions
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        case PhysicsCategorys.wall | PhysicsCategorys.blockOne:
            print("contact")
        case PhysicsCategorys.blockOne | PhysicsCategorys.endPointOne:
            print("yo")
            
        default:
            print("nope")
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        case PhysicsCategorys.blockOne | PhysicsCategorys.endPointOne:
            print("lost contact")
        default:
            print("nope")
        }
    }
}
