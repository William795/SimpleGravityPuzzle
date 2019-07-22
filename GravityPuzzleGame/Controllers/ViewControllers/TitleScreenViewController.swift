//
//  TitleScreenViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit
import SpriteKit

class TitleScreenViewController: UIViewController {

    @IBOutlet weak var particles: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = particles {
            
            let scene = ParticleScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
            scene.blockRef = 1
        }
    }
}
