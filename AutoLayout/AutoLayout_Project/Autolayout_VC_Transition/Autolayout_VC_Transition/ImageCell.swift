//
//  ImageCell.swift
//  Autolayout_VC_Transition
//
//  Created by jhlee on 2023/09/05.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView! {
        didSet{
            leftImageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var middleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
