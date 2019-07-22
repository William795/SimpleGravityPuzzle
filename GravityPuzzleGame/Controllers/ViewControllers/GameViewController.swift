//
//  GameViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/8/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit
import SpriteKit
import GoogleMobileAds

let screenSize: CGRect = UIScreen.main.bounds
let sideBorders: CGSize = CGSize(width: screenSize.width / 6, height: screenSize.height)
let topBorder: CGSize = CGSize(width: screenSize.width, height: screenSize.height / 12)
let bottomBorder: CGSize = CGSize(width: screenSize.width, height: screenSize.height / 7)

var gameState = 0

class GameViewController: UIViewController {
    
    var interstitial: GADInterstitial!
    var level: Level?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        
        gameState = 0
        self.navigationController?.navigationBar.isHidden = true
        makeGameScene()
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if gameState == 1{
                self.goToView()
                print("pause")
            } else if gameState == 2 {
                timer.invalidate()
            }
            print("not pause")
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        makeGameScene()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        gameState = 2
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - TODO make it do a fancy animation on winning the game
    func goToView() {
//        showAdd()
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameWon") as? GameWonViewController else {return}
        self.addChild(detailVC)
        //        self.present(detailVC, animated: true, completion: nil)
        detailVC.delegate = self
        detailVC.view.frame = self.view.frame
        self.view.addSubview(detailVC.view)
        detailVC.didMove(toParent: self)
    }
    
    func showAdd() {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        }else {
            print("Ad wasn't ready")
        }
    }
    
    func makeGameScene() {
        if let view = self.view as! SKView? {
            
            let scene = GameScene(size: view.bounds.size)
            
            scene.level = level
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
}

extension GameViewController: GameViewControllerDelegate {
    func playAgainTapped() {
        makeGameScene()
    }
    
    func popViews() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.popViewController(animated: false)
    }
}
