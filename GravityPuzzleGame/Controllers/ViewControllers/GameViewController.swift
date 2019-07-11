//
//  GameViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit
import SpriteKit


let screenSize: CGRect = UIScreen.main.bounds
let sideBorders: CGSize = CGSize(width: screenSize.width / 6, height: screenSize.height)
let topBorder: CGSize = CGSize(width: screenSize.width, height: screenSize.height / 12)
let bottomBorder: CGSize = CGSize(width: screenSize.width, height: screenSize.height / 4)

class GameViewController: UIViewController {
    
    var level: Level?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        if let view = self.view as! SKView? {

            let scene = GameScene(size: view.bounds.size)

            scene.level = level
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true

        }
    }
    
    
    
    @IBAction func DisplayOtherthingTapped(_ sender: Any) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameWon") as? GameWonViewController else {return}
        self.addChild(detailVC)
        detailVC.view.frame = self.view.frame
        self.view.addSubview(detailVC.view)
        detailVC.didMove(toParent: self)
    }
}
