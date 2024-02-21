//
//  WorkStatusCell.swift
//  Chart_with_AppDesign
//
//  Created by jhlee on 10/30/23.
//

import UIKit

class WorkStatusCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    
    var barColor: UIColor = .white {
        didSet{
            leftBar.backgroundColor = barColor
        }
    }
    var mainTitle: String = "" {
        didSet{
            topTitleLabel.text = mainTitle
        }
    }
    var subTitle: String = "" {
        didSet{
            bottomSubTitleLabel.text = subTitle
        }
    }

    private let leftBar: UIView = {
       let bar = UIView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.widthAnchor.constraint(equalToConstant: 6).isActive = true
        bar.layer.cornerRadius = 3
        return bar
    }()
    
    private let topTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()
    
    private let bottomSubTitleLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = .systemFont(ofSize: 18, weight: .bold)
         return label
    }()
    
    lazy var stackview: UIStackView = {
        
        let stackView1 = UIStackView()
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .vertical
        stackView1.addArrangedSubview(topTitleLabel)
        stackView1.addArrangedSubview(bottomSubTitleLabel)
        stackView1.distribution = .fillEqually
        stackView1.spacing = 10
//        topTitleLabel.backgroundColor = .systemBlue
//        bottomSubTitleLabel.backgroundColor = .systemGray
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(stackView1)
        containerView.leadingAnchor.constraint(equalTo: stackView1.leadingAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: stackView1.centerYAnchor).isActive = true

        let stackView2 = UIStackView()
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .horizontal
        stackView2.addArrangedSubview(leftBar)
        stackView2.addArrangedSubview(containerView)
        stackView2.spacing = 10
        stackView2.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        stackView2.isLayoutMarginsRelativeArrangement = true
        stackView2.clipsToBounds = true
        return stackView2
    }()
    
    private func setupLayout() {
//        self.contentView.backgroundColor = .lightGray
        self.contentView.addSubview(stackview)
        
        stackview.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        stackview.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        stackview.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        stackview.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
    }
    
    
    
}
