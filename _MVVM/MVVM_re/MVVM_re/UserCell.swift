//
//  UserCell.swift
//  MVVM_re
//
//  Created by 전율 on 2024/01/14.
//

import UIKit
import Combine

class UserCell: UITableViewCell {    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var cancellabels:Set<AnyCancellable> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 셀이 화면 밖으로 나갔다가 다시 들어올 때
    override func prepareForReuse() {
        super.prepareForReuse()
        cancellabels.removeAll()
    }
    
}
