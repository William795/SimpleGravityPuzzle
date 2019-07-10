//
//  LevelCollectionViewCell.swift
//  GravityPuzzleGame
//
//  Created by William Moody on 7/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    
    var level: Level? {
        didSet {
            updateCell()
        }
    }
    
    @IBOutlet weak var checkMarkImage: UIImageView!
    @IBOutlet weak var levelNumberLabel: UILabel!
    
    func updateCell() {
        guard let level = level else {return}
        if level.isComplete {
            checkMarkImage.isHidden = false
        }
    }
}
