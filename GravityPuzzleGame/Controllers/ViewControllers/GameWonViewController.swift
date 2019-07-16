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
    }
    

    @IBAction func levelSelectButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.popViews()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol GameViewControllerDelegate: class {
    func popViews()
}
