//
//  ViewController.swift
//  Chart_with_AppDesign
//
//  Created by jhlee on 10/29/23.
//

import UIKit


// left
//line.3.horizontal

// right
//text.bubble
//envelope.badge
//profile_photo_8

class ViewController: UIViewController {
    
    
    let mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Leave & Attendance"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You have 2 leave request pending."
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    lazy var titleStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(mainTitle)
        stackView.addArrangedSubview(subTitle)
        stackView.spacing = 10
        return stackView
    }()
    
    private func setupNavigationDesign() {
        // Do any additional setup after loading the view.
        let line = UIImage(systemName: "line.3.horizontal")
        let leftButton = UIBarButtonItem(image: line, style: .plain, target: self, action: #selector(selectButton))
        leftButton.tintColor = .magenta
        leftButton.tag = 100
        
        let profileImage = UIImage(named: "profile_photo_8")?.withRenderingMode(.alwaysOriginal)
        
        //        let rightProfileButton = UIButton(type: .custom)
        //        rightProfileButton.setImage(profileImage, for: .normal)
        //        rightProfileButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        //        rightProfileButton.layer.cornerRadius = 20
        //        rightProfileButton.clipsToBounds = true
        //        rightProfileButton.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
        
        
        let rightProfileButton = ProfileButton()
        rightProfileButton.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
        rightProfileButton.tag = 200
        
        let rightButton1 = UIBarButtonItem(customView: rightProfileButton)
        let rightButton2 = UIBarButtonItem(image: UIImage(systemName: "envelope.badge"), style: .plain, target: self, action: #selector(selectButton))
        rightButton2.tag = 201
        let rightButton3 = UIBarButtonItem(image: UIImage(systemName: "text.bubble"), style: .plain, target: self, action: #selector(selectButton))
        rightButton3.tag = 202
        
        
        self.navigationItem.leftBarButtonItem = leftButton
        
        self.navigationItem.rightBarButtonItems = [rightButton1, rightButton2, rightButton3]
        

    }
    
    private func setupTitleView() {
        // add title stack view
        self.view.addSubview(titleStackView)
        
        titleStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        titleStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
    }
    
    private func loadChartVC() {
        
        // chart container view controller
        
        let containerVC = ChartContainerViewController()
        
        self.view.addSubview(containerVC.view)
        containerVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        containerVC.view.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant:  30).isActive = true
        containerVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30).isActive = true
        containerVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        containerVC.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true

        self.addChild(containerVC)
        containerVC.didMove(toParent: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationDesign()
        
        setupTitleView()
      
        loadChartVC()
        
    }
    
    @objc func selectButton(button: UIBarButtonItem) {
        print("button tag ", button.tag)
        print(" button tapped")
    }
    
    
}

