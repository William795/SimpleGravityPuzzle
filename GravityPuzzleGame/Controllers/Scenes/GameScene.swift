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
    
    var blockOne: SKSpriteNode?
    var blockTwo: SKSpriteNode?
    var blockThree: SKSpriteNode?
    var blockFour: SKSpriteNode?
    //MARK: Scene Set Up
    
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
            makeBlock(startPosition: block.startingPoint, colorRef: block.colorReference, propertyRef: block.propertiesReference, blockID: blockNumber, size: block.blockSize)
            makeEndPoint(endPosition: block.goalPoint, endPointID: blockNumber, colorRef: block.colorReference, size: block.blockSize)
            block.isInPlace = false
            blockNumber += 1
        }
    }
    
    func makeBlock(startPosition: CGPoint, colorRef: Int, propertyRef: Int, blockID: Int, size: CGSize) {
        let block = SKSpriteNode(color: getBlockColor(colorRef: colorRef), size: size)
        block.name = "\(propertyRef)"
        block.position = startPosition
        block.zPosition = ZPosition.gameElements
        block.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size.width + 1, height: size.height + 1))
        block.physicsBody?.collisionBitMask = PhysicsCategorys.wall
        block.physicsBody?.allowsRotation = false
        
        addChild(blockPhysicsBody(sprite: block, ID: blockID))
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
    
    func blockPhysicsBody(sprite: SKSpriteNode, ID: Int) -> SKSpriteNode {
        switch ID {
        case 1:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockOne
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.endPointOne
            blockOne = sprite
            return blockOne ?? sprite
        case 2:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockTwo
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.endPointTwo
            blockTwo = sprite
            return blockTwo ?? sprite
        case 3:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockThree
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.endPointThree
            blockThree = sprite
            return blockThree ?? sprite
        case 4:
            sprite.physicsBody?.categoryBitMask = PhysicsCategorys.blockFour
            sprite.physicsBody?.contactTestBitMask = PhysicsCategorys.endPointFour
            blockFour = sprite
            return blockFour ?? sprite
        default:
            return sprite
        }
    }
    
    //MARK: EndPoint set up
    
    func makeEndPoint(endPosition: CGPoint, endPointID: Int, colorRef: Int, size: CGSize) {
        let goal = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: getBlockColor(colorRef: colorRef), size: CGSize(width: size.width / 2, height: size.height / 2))
        goal.position = endPosition
        goal.colorBlendFactor = 1.0
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
        let leftSize = sideBorders
        makePerimeterWall(side: leftSide, size: leftSize)
        
        let rightSide = CGPoint(x: frame.maxX, y: frame.midY)
        let rightSize = sideBorders
        makePerimeterWall(side: rightSide, size: rightSize)
        
        let topSide = CGPoint(x: frame.midX, y: frame.maxY)
        let topSize = topBorder
        makePerimeterWall(side: topSide, size: topSize)
        
        let bottomSide = CGPoint(x: frame.midX, y: frame.minY)
        let bottomSize = bottomBorder
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
                node.physicsBody?.isDynamic = !node.physicsBody!.isDynamic
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

        self.removeFromParent()
        levelFinished = true
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
            level?.blocks[0].isInPlace = true
            
            gameWinCheck()
            
        case PhysicsCategorys.blockTwo | PhysicsCategorys.endPointTwo:
            level?.blocks[1].isInPlace = true
            
            gameWinCheck()
            
        case PhysicsCategorys.blockThree | PhysicsCategorys.endPointThree:
            level?.blocks[2].isInPlace = true
            
            gameWinCheck()
            
        case PhysicsCategorys.blockFour | PhysicsCategorys.endPointFour:
            level?.blocks[3].isInPlace = true
            
            gameWinCheck()
            
        default:
            print("contact did start Default hit")
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        case PhysicsCategorys.blockOne | PhysicsCategorys.endPointOne:
            level?.blocks[0].isInPlace = false
            
        case PhysicsCategorys.blockTwo | PhysicsCategorys.endPointTwo:
            level?.blocks[1].isInPlace = false
            
        case PhysicsCategorys.blockThree | PhysicsCategorys.endPointThree:
            level?.blocks[2].isInPlace = false
            
        case PhysicsCategorys.blockFour | PhysicsCategorys.endPointFour:
            level?.blocks[3].isInPlace = false
            
        default:
            print("contact did end Default hit")
        }
    }
}

extension GameScene {
    //MARK: Gravity funtions
    
    func redBlockGravityChange() {
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
}

enum Direction {
    case up, down, left, right
}