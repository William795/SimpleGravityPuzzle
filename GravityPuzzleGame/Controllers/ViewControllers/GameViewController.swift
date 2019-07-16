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
var isGameWon = false
class GameViewController: UIViewController {
    
    var level: Level?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isGameWon = false
        self.navigationController?.navigationBar.isHidden = true
        
        if let view = self.view as! SKView? {

            let scene = GameScene(size: view.bounds.size)

            scene.level = level
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true

            _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                if isGameWon {
                    self.goToView()
                    print("pause")
                    timer.invalidate()
                }
                print("not pause")
            }
        }
    }
    
    
    @IBAction func DisplayOtherthingTapped(_ sender: Any) {
        goToView()
    }
    
    func goToView() {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameWon") as? GameWonViewController else {return}
        self.addChild(detailVC)
        detailVC.delegate = self
        detailVC.view.frame = self.view.frame
        self.view.addSubview(detailVC.view)
        detailVC.didMove(toParent: self)
    }
}

extension GameViewController: GameViewControllerDelegate {
    func popViews() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
}
