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

enum Colors: Int {
    case red, blue, yellow, green
}
