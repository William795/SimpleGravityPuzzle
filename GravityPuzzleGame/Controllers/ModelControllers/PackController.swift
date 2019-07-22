//
//  PackController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class PackController {
    
    static let shared = PackController()
    
    var packOne = Pack(isCompleted: false, purchased: true, levels: LevelController.shared.makePackOneLevelArray())
}
