//
//  PackSelectViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit
import SpriteKit

class PackSelectViewController: UIViewController {

    @IBOutlet weak var particles: SKView!
    let packOne: Pack = PackController.shared.packOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = particles {
            
            let scene = ParticleScene(size: view.bounds.size)
            scene.blockRef = 2
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLevelSelectFromPackOne" {
            let packSent = packOne
            let destinationVC = segue.destination as? LevelSelectViewController
            destinationVC?.pack = packSent
        }
    }
 

}

