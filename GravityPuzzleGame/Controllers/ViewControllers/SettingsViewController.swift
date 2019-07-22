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
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
    
    @IBAction func PPButtonPressed(_ sender: Any) {
        openUrl(urlStr: "https://www.privacypolicies.com/privacy/view/e658c5c4763629c0ff23453431e98fab")
    }
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:]) { (true) in
            }
        }
    }
}
