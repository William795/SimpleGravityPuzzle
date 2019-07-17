//
//  GameWonViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class GameWonViewController: UIViewController {

    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        print("won screen")
        gameState = 0
    }
    

    @IBAction func levelSelectButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.popViews()
    }
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        delegate?.playAgainTapped()
        self.view.removeFromSuperview()
    }
}

protocol GameViewControllerDelegate: class {
    func popViews()
    func playAgainTapped()
}
