//
//  PackSelectViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class PackSelectViewController: UIViewController {

    let levelArray = [LevelController.shared.makeFirstLevel(), LevelController.shared.makeSecondLevel()]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func pack1ButtonTapped(_ sender: Any) {
        let pack = Pack(isCompleted: false, levels: levelArray, purchased: true)
        showChildView(ofPack: pack)
    }
    
    func showChildView(ofPack: Pack) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LevelSelect") as? LevelSelectViewController else {return}
        self.addChild(detailVC)
        detailVC.view.frame = self.view.frame
        self.view.addSubview(detailVC.view)
        detailVC.didMove(toParent: self)
        
        detailVC.pack = ofPack
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
