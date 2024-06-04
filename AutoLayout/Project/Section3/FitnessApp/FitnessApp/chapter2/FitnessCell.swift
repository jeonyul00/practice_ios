//
//  FitnessCell.swift
//  FitnessApp
//
//  Created by 전율 on 2024/05/27.
//

import UIKit

class FitnessCell: UITableViewCell {
    
    var plan: PlanList? {
        didSet {
            fitnessTitle.text = plan?.planType
            let imgName = plan?.imageName ?? ""
            let filePath = Bundle.main.path(forResource: "Fitness/\(imgName)", ofType: nil) ?? ""
            if let image = UIImage(contentsOfFile: filePath) {
                bgImageView.image = image
            } else {
                print("Image not found at path: \(filePath)")
            }
        }
    }
    
    @IBOutlet weak var bgImageView: UIImageView! {
        didSet {
            bgImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var fitnessTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
