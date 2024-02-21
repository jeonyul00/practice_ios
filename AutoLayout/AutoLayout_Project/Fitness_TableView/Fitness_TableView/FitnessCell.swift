//
//  FitnessCell.swift
//  Fitness_TableView
//
//  Created by jhlee on 2023/05/18.
//

import UIKit

class FitnessCell: UITableViewCell {
    
    var plan: PlanList? {
        didSet{
            fitnessTitle.text = plan?.planType
            let imageName = plan?.imageName ?? ""
            bgImageView.image = UIImage(named: imageName)
        }
    }
    
    
    @IBOutlet weak var fitnessTitle: UILabel!
    
    @IBOutlet weak var bgImageView: UIImageView! {
        didSet{
            bgImageView.layer.cornerRadius = 10
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
