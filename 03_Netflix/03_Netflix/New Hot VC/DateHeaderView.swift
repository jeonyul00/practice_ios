//
//  DateHeaderView.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/09.
//

import UIKit

class DateHeaderView: UITableViewHeaderFooterView {
    
    private var dateLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.backgroundColor = .black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // NSMutableAttributedString: 스트링을 부분적으로 스타일 변경 가능
    var dateAttributeString: NSMutableAttributedString? {
        didSet{
            dateLabel.attributedText = dateAttributeString
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(dateLabel)
        dateLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 50).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5).isActive = true
        
    }
    
    // xib
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
