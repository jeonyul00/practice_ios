//
//  HomeTableViewHeaderView.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/19.
//

import UIKit

class HomeTableViewHeaderView: UITableViewHeaderFooterView {
    var title:String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor,constant: 20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
            
    private var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
}
