//
//  PackSelectViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class PackSelectViewController: UIViewController {

    let packOne: Pack = PackController.shared.packOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

