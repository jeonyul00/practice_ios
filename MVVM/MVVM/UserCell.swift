//
//  UserCell.swift
//  MVVM
//
//  Created by 전율 on 2023/12/21.
//

import UIKit
import Combine

class UserCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var cancellabels: Set<AnyCancellable> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // 값이 화면을 벗어났다가 들어와도 다시 sink가 호출되는 문제 해결
    // prepareForReuse : 셀이 화면 밖으로 나갔다 들어올 준비가 완료됐을 때 호출
    override func prepareForReuse() {
        super.prepareForReuse()
        cancellabels.removeAll()
    }
    
}

