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
    var levelFinished = false
    var gravityOn = true
    
    var blockOne: SKSpriteNode?
    var blockTwo: SKSpriteNode?
    var blockThree: SKSpriteNode?
    var blockFour: SKSpriteNode?
    var blockFive: SKSpriteNode?
    var gravityTeller: SKSpriteNode?
    //MARK: Scene Set Up
    
    let wallColor = UIColor(displayP3Red: 0.44, green: 0.44, blue: 0.42, alpha: 1)
    
    var currentDirection: Direction = .down {
        didSet {
            switch self.currentDirection {
            case .up:
                physicsWorld.gravity = CGVector(dx: 0, dy: 10)
            case .right:
                physicsWorld.gravity = CGVector(dx: 10, dy: 0)
            case .down:
                physicsWorld.gravity = CGVector(dx: 0, dy: -10)
            case.left:
                physicsWorld.gravity = CGVector(dx: -10, dy: 0)
            }
        }
    }
    
    override func didMove(to view: SKView) {
        print(screenSize.width)
        print(screenSize.height)
        backgroundColor = UIColor(displayP3Red: 0.1, green: 0.11, blue: 0.13, alpha: 1)
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
        setUpGravityTeller()
        gravityTeller?.run(SKAction.rotate(toAngle: 270.degreesToRadians, duration: 0.1))
    }
    
    func setUpGravityTeller() {
        makeGravityTellerG()
        makeGravityTellerBall()
    }
    
    func setUpWalls() {
        perimeterSetUp()
        makeBottomBackground()
        for wall in level?.walls ?? [] {
            makeWallFrom(size: wall.size, position: wall.position)
        }
    }
    
    //MARK: Block SetUp
    
    func setUpBlocks() {
        var blockNumber = 1
        for block in level?.blocks ?? [] {
            makeBlock(startPosition: block.startingPoint, colorRef: block.colorReference, propertyRef: block.propertiesReference, blockID: blockNumber, size: block.blockSize)
            makeEndPoint(endPosition: block.goalPoint, endPointID: blockNumber, colorRef: block.colorReference, size: block.blockSize)
            blockNumber += 1
        }
    }
    
    func makeBlock(startPosition: CGPoint, colorRef: Int, propertyRef: Int, blockID: Int, size: CGSize) {
        let block = SKSpriteNode(color: getBlockColor(colorRef: colorRef), size: size)
        block.name = "\(propertyRef)"
        block.texture = getSpriteTextureFrom(propertyRef: propertyRef)
        block.colorBlendFactor = 1
        
        block.position = startPosition
        block.zPosition = ZPosition.gameElements
        block.physicsBody = SKPhysicsBody(circleOfRadius: size.height / 1.95)
        block.physicsBody?.collisionBitMask = PhysicsCategorys.wall
        block.physicsBody?.restitution = 0.0
        block.physicsBody?.allowsRotation = false
        
        addChild(blockPhysicsBody(sprite: block, ID: blockID))
    }
    
    func getBlockColor(colorRef: Int) -> UIColor {
        var color = UIColor(ciColor: .red)
        switch colorRef {
        case 1:
            color = UIColor(displayP3Red: 0.94, green: 0.31, blue: 0.32, alpha: 1)
        case 2:
            color = UIColor(displayP3Red: 0.15, green: 0.87, blue: 0.81, alpha: 1)
        case 3:
            color = .yellow
        case 4:
            color = UIColor(displayP3Red: 0.0, green: 0.63, blue: 0.27, alpha: 1)
        case 5:
            color = .gray
        default:
            color = .red
        }
        return color
    }
    
    func getSpriteTextureFrom(propertyRef: Int) -> SKTexture {
        switch propertyRef {
        case 1:
            return SKTexture(imageNamed: "LeftRotation")
        case 2:
            return SKTexture(imageNamed: "Rotation")
        case 3:
            return SKTexture(imageNamed: "upDown")
        case 4:
            return SKTexture(imageNamed: "pause")
        case 5:
            return SKTexture(imageNamed: "Swap")
        default:
            return SKTexture(imageNamed: "LeftRotation")
        }
    }
    
    func blockPhysicsBody(sprite: SKSpriteNode, ID: Int) -> SKSpriteNode {
        switch ID {
        case 1:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockOne
            blockOne = sprite
            return blockOne ?? sprite
        case 2:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockTwo
            blockTwo = sprite
            return blockTwo ?? sprite
        case 3:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockThree
            blockThree = sprite
            return blockThree ?? sprite
        case 4:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockFour
            return blockFour ?? sprite
        case 5:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockFive
            return blockFive ?? sprite
        default:
            return sprite
        }
    }
    
    //MARK: EndPoint set up
    
    func makeEndPoint(endPosition: CGPoint, endPointID: Int, colorRef: Int, size: CGSize) {
        let goal = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: getBlockColor(colorRef: colorRef), size: CGSize(width: size.width / 2, height: size.height / 2))
        goal.position = endPosition
        goal.colorBlendFactor = 1.0
        goal.zPosition = ZPosition.highest
        goal.physicsBody = SKPhysicsBody(rectangleOf: size)
        endPointCategoryBitmask(sprite: goal, ID: endPointID)
        goal.physicsBody?.isDynamic = false
        goal.physicsBody?.isResting = true
        
        addChild(goal)
    }
    
    func endPointCategoryBitmask(sprite: SKSpriteNode, ID: Int) {
        switch ID {
        case 1:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointOne
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.blockOne
        case 2:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointTwo
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.blockTwo
        case 3:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointThree
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.blockThree
        case 4:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointFour
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.blockFour
        case 5:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.endPointFive
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.blockFive
        default:
            return
        }
    }
    
    //MARK: Wall Set Up
    
    func makeWallFrom(size: CGSize, position: CGPoint) {
        let wall = SKSpriteNode(color: wallColor, size: size)
        wall.position = position
        wall.zPosition = ZPosition.gameElements
        wall.physicsBody = SKPhysicsBody(rectangleOf: size)
        wall.physicsBody?.categoryBitMask = PhysicsCategorys.wall
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.restitution = 0.0
        
        addChild(wall)
    }
    
    func perimeterSetUp() {
        let leftSide = CGPoint(x: frame.minX, y: frame.midY)
        let leftSize = sideBorders
        makePerimeterWall(side: leftSide, size: leftSize)
        
        let rightSide = CGPoint(x: frame.maxX, y: frame.midY)
        let rightSize = sideBorders
        makePerimeterWall(side: rightSide, size: rightSize)
        
        let topSide = CGPoint(x: frame.midX, y: frame.maxY)
        let topSize = topBorder
        makePerimeterWall(side: topSide, size: topSize)
        
        let bottomSide = CGPoint(x: frame.midX, y: screenSize.maxY * 0.13)
        let bottomSize = CGSize(width: screenSize.width, height: screenSize.maxY * 0.01)
        makePerimeterWall(side: bottomSide, size: bottomSize)
    }
    
    func makePerimeterWall(side: CGPoint, size: CGSize) {
        let wall = SKSpriteNode(color: wallColor, size: size)
        wall.position = side
        wall.zPosition = ZPosition.gameElements
        wall.physicsBody = SKPhysicsBody(rectangleOf: size)
        wall.physicsBody?.categoryBitMask = PhysicsCategorys.wall
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.restitution = 0.0
        
        addChild(wall)
    }
    
    func makeBottomBackground() {
        let bottomBackground = SKShapeNode(rect: CGRect(origin: CGPoint(x: screenSize.minX, y: screenSize.maxY * -0.015), size: bottomBorder))
        bottomBackground.fillColor = wallColor
        bottomBackground.zPosition = ZPosition.label
        bottomBackground.strokeColor = wallColor
        
        addChild(bottomBackground)
    }
    
    //MARK: - Gravity informer
    
    func makeGravityTellerG() {
        let gravityTeller = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: .darkGray, size: CGSize(width: screenSize.width / 5, height: screenSize.height / 10))
        gravityTeller.position = CGPoint(x: screenSize.maxX * 0.8, y: screenSize.maxY * 0.07)
        gravityTeller.colorBlendFactor = 1
        gravityTeller.zPosition = ZPosition.gravityTeller
        gravityTeller.physicsBody = SKPhysicsBody(edgeLoopFrom: CGPath(ellipseIn: CGRect(origin: CGPoint(x: screenSize.maxX * -0.1, y: screenSize.maxY * -0.051), size: CGSize(width: screenSize.width / 5, height: screenSize.height / 10)), transform: nil))
        gravityTeller.physicsBody?.categoryBitMask = PhysicsCategorys.gravityTeller
        gravityTeller.physicsBody?.collisionBitMask = PhysicsCategorys.gravityTeller
        gravityTeller.physicsBody?.isDynamic = false
        gravityTeller.physicsBody?.restitution = 0.2
        
        addChild(gravityTeller)
    }
    
    func makeGravityTellerBall() {
        let ball = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), size: CGSize(width: screenSize.width * 0.08, height: screenSize.height * 0.04))
        ball.color = UIColor(displayP3Red: 0.90, green: 0.91, blue: 0.7, alpha: 1)
        ball.colorBlendFactor = 1
        ball.position = CGPoint(x: screenSize.maxX * 0.8, y: screenSize.maxY * 0.07)
        ball.zPosition = ZPosition.ball
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
        ball.physicsBody?.categoryBitMask = PhysicsCategorys.gravityTeller
        ball.physicsBody?.contactTestBitMask = PhysicsCategorys.gravityTeller
        ball.physicsBody?.collisionBitMask = PhysicsCategorys.gravityTeller
        ball.physicsBody?.affectedByGravity = true
        ball.physicsBody?.restitution = 0.5
        
        addChild(ball)
    }
    
    //MARK: Touch Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if levelFinished {
            return
        }
        var pos: CGPoint!
        for touch in touches {
            pos = touch.location(in: self)
        }
        for node in nodes(at: pos) {
            switch node.name {
            case "1":
                redBlockGravityChange()
            case "2":
                blueBlockGravityChange()
            case "3":
                yelloBlockGravityChange()
            case "4" :
                greenBlockGravityChange()
                if node.physicsBody?.affectedByGravity ?? true {
                    node.run(SKAction.setTexture(SKTexture(imageNamed: "pause")))
                } else {
                    node.run(SKAction.setTexture(SKTexture(imageNamed: "play")))
                }
            case "5":
                greyBlockSwap()
                
            default:
                print("nothing")
            }
        }
    }
    
    //MARK: Game end functions
    
    func gameWinCheck() {
        guard let level = level else {return}
        var blocksInPlace = 0
        for block in level.blocks {
            if block.isInPlace {
                blocksInPlace += 1
            }
        }
        if level.blocks.count == blocksInPlace {
            gameWon()
        }
    }
    
    func gameWon() {
        gameState = 1
        levelFinished = true
        
        PersistanceManager.updateLevel(level?.levelRef ?? 0, complete: true)
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
    //MARK: Contact Funtions
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        
        switch contactMask {
        case PhysicsCategorys.wall | PhysicsCategorys.blockOne:
            print("contact")
            
        case PhysicsCategorys.gravityTeller | PhysicsCategorys.gravityTeller:
            return
            
        case PhysicsCategorys.blockOne | PhysicsCategorys.endPointOne:
            level?.blocks[0].isInPlace = true
            contact.bodyA.node?.run(SKAction.fadeOut(withDuration: 0.5)) {
                contact.bodyA.node?.removeFromParent()
            }
            contact.bodyB.node?.run(SKAction.fadeOut(withDuration: 0.5)) {
                contact.bodyB.node?.removeFromParent()
            }
            gameWinCheck()
            
        case PhysicsCategorys.blockTwo | PhysicsCategorys.endPointTwo:
            level?.blocks[1].isInPlace = true
            contact.bodyA.node?.run(SKAction.fadeOut(withDuration: 0.5)) {
                contact.bodyA.node?.removeFromParent()
            }
            contact.bodyB.node?.run(SKAction.fadeOut(withDuration: 0.5)) {
                contact.bodyB.node?.removeFromParent()
            }
            gameWinCheck()
            
        case PhysicsCategorys.blockThree | PhysicsCategorys.endPointThree:
            level?.blocks[2].isInPlace = true
            contact.bodyA.node?.run(SKAction.fadeOut(withDuration: 0.5)) {
                contact.bodyA.node?.removeFromParent()
            }
            contact.bodyB.node?.run(SKAction.fadeOut(withDuration: 0.5)) {
                contact.bodyB.node?.removeFromParent()
            }
            gameWinCheck()
            
        case PhysicsCategorys.blockFour | PhysicsCategorys.endPointFour:
            level?.blocks[3].isInPlace = true
            contact.bodyA.node?.run(SKAction.fadeOut(withDuration: 0.5)) {
                contact.bodyA.node?.removeFromParent()
            }
            contact.bodyB.node?.run(SKAction.fadeOut(withDuration: 0.5)) {
                contact.bodyB.node?.removeFromParent()
            }
            gameWinCheck()
            
        default:
            print("stuff")
        }
    }
}

extension GameScene {
    //MARK: Gravity funtions
    
    func redBlockGravityChange() {
        gravityTeller?.run(SKAction.rotate(byAngle: 90.degreesToRadians, duration: 0.5))
        switch currentDirection {
        case .down:
            currentDirection = Direction.right
        case .right:
            currentDirection = Direction.up
        case .up:
            currentDirection = Direction.left
        case .left:
            currentDirection = Direction.down
        }
    }
    
    func blueBlockGravityChange() {
        gravityTeller?.run(SKAction.rotate(byAngle: -90.degreesToRadians, duration: 0.5))
        switch currentDirection {
        case .down:
            currentDirection = Direction.left
        case .left:
            currentDirection = Direction.up
        case .up:
            currentDirection = Direction.right
        case .right:
            currentDirection = Direction.down
        }
    }
    
    func yelloBlockGravityChange() {
        gravityTeller?.run(SKAction.rotate(byAngle: 180.degreesToRadians, duration: 1.0))
        switch currentDirection {
        case .down:
            currentDirection = Direction.up
        case .up:
            currentDirection = Direction.down
        case .right:
            currentDirection = Direction.left
        case .left:
            currentDirection = Direction.right
        }
    }
    
    func greenBlockGravityChange() {
        self.childNode(withName: "1")?.physicsBody?.affectedByGravity = !gravityOn
        self.childNode(withName: "2")?.physicsBody?.affectedByGravity = !gravityOn
        self.childNode(withName: "3")?.physicsBody?.affectedByGravity = !gravityOn
        self.childNode(withName: "4")?.physicsBody?.affectedByGravity = !gravityOn
        self.childNode(withName: "5")?.physicsBody?.affectedByGravity = !gravityOn
        gravityOn = !gravityOn
    }
    
    func greyBlockSwap() {
        guard let posA = blockOne?.position,
            let posB = blockTwo?.position else {return}
        
        blockOne?.run(SKAction.fadeOut(withDuration: 0.5)) {
            self.blockOne?.position = posB
            self.blockOne?.run(SKAction.fadeIn(withDuration: 0.5))
        }
        
        blockTwo?.run(SKAction.fadeOut(withDuration: 0.5)) {
            self.blockTwo?.position = posA
            self.blockTwo?.run(SKAction.fadeIn(withDuration: 0.5))
        }
    }
}

enum Direction {
    case up, down, left, right
}
