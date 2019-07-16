//
//  LevelSelectViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

private let reuseIdentifier = "levelCell"

class LevelSelectViewController: UIViewController {

    var pack: Pack?
    
    @IBOutlet weak var levelCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pack = PackController.shared.packOne
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameSceneFromLevelSelect", let indexPath = levelCollectionView.indexPathsForSelectedItems{
            let level = pack?.levels[indexPath.first?.row ?? 0]
            let destinationVC = segue.destination as? GameViewController
            destinationVC?.level = level
        }
    }
    

}

extension LevelSelectViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pack?.levels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? LevelCollectionViewCell
        
        cell?.levelNumberLabel.text = "\(indexPath.row + 1)"
        cell?.level = pack?.levels[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
