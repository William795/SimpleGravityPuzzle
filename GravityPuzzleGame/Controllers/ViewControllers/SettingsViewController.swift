//
//  SettingsViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/19/19.
//  Copyright © 2019 William Moody. All rights reserved.
//
import SpriteKit
import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var particles: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = particles {
            
            let scene = ParticleScene(size: view.bounds.size)
            scene.blockRef = 4
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}
