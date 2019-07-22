//
//  LevelSelectViewController.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit
import SpriteKit

private let reuseIdentifier = "levelCell"

class LevelSelectViewController: UIViewController {

    @IBOutlet weak var particles: SKView!
    @IBOutlet weak var levelCollectionView: UICollectionView!
    
    var pack: Pack?
    var completedDict: [String : Bool]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameState = 2
        setCompletedLevels()
        
        if let view = particles {
            let scene = ParticleScene(size: view.bounds.size)
            scene.blockRef = 3
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCompletedLevels()
        levelCollectionView.reloadData()
        gameState = 2
    }

    func setCompletedLevels() {
        completedDict = PersistanceManager.fetchLevelCompletion(for: pack?.levels.count ?? 0)
        var levelArray: [Level] = []
        for level in pack?.levels ?? [] {
            var setLevel = level
            setLevel.isComplete = completedDict?["level \(setLevel.levelRef)"] ?? false
            levelArray.append(setLevel)
        }
        pack?.levels = levelArray
    }
    
    // MARK: - Navigation

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
        
        guard let level = pack?.levels[indexPath.row] else {return UICollectionViewCell()}
        
        cell?.levelNumberLabel.text = "\(indexPath.row + 1)"
        cell?.level = level
        
        if level.isComplete {
            cell?.checkMarkImage.isHidden = false
        } else {
            cell?.checkMarkImage.isHidden = true
        }
        
        return cell ?? UICollectionViewCell()
    }
}
