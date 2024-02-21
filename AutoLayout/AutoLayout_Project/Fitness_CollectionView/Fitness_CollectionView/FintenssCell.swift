//
//  FintenssCell.swift
//  Fitness_CollectionView
//
//  Created by jhlee on 2023/08/08.
//

import UIKit

class FitnessCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!{
        didSet{
            bgImageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var fitnessTitle: UILabel!{
        didSet{
            fitnessTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            fitnessTitle.textColor = .white
        }
    }
    
}
