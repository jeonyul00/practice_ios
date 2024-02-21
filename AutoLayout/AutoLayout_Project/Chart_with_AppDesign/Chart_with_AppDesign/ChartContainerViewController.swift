//
//  ChartContainerViewController.swift
//  Chart_with_AppDesign
//
//  Created by jhlee on 10/30/23.
//

import UIKit

class ChartContainerViewController: UIViewController {

    let chartView = ChartWithTitleView()
    
    let workStatusVC = WorkStatus(collectionViewLayout: UICollectionViewFlowLayout())

    
    let topTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Teams"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    let dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "From 4-10 Sep. 2023"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(topTitleLabel)
        stackView.addArrangedSubview(dateLabel)
        return stackView
    }()
    
    
    
    let rightButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrowtriangle.up.fill"), for: .normal)
        button.tintColor = .black
        button.setTitle("This Week", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        
        var config = UIButton.Configuration.plain()
        config.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        config.imagePadding = 10
        button.configuration = config
        
        return button
    }()
    
    private func makeButtonMenu() {
        let action1 = UIAction(title: "action1", image: nil, identifier: nil, discoverabilityTitle: nil, attributes: [], state: .off) { action in
             print("selected action1")
         }
        
        let action2 = UIAction(title: "action2", image: nil, identifier: nil, discoverabilityTitle: nil, attributes: .destructive, state: .off) { action in
             print("selected action2")
         }
        
        
       let menu = UIMenu(title: "menu title", options: .destructive, children: [action1, action2])
        
        rightButton.menu = menu
        rightButton.showsMenuAsPrimaryAction = true

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rightButton.layer.cornerRadius = rightButton.bounds.height / 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let contentHeight = workStatusVC.collectionView.contentSize.height
        workStatusVC.collectionView.heightAnchor.constraint(equalToConstant: contentHeight).isActive = true
    }
    
    private func setupTitleDesign() {
        self.view.addSubview(stackView)
        self.view.addSubview(rightButton)
        
        
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        
        stackView.trailingAnchor.constraint(greaterThanOrEqualTo: rightButton.leadingAnchor, constant: -10).isActive = true
        
        rightButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    private func makeOutline() {
        self.view.layer.borderColor = UIColor.darkGray.cgColor
        self.view.layer.borderWidth = 1
        self.view.layer.cornerRadius = 10

    }
    
    private func loadDonutChartView() {
        
        chartView.segments = [
            (UIColor.systemRed, 50),
            (UIColor.systemBlue, 50),
            (UIColor.systemCyan, 180),
            (UIColor.systemMint, 120),
        ]
        
        chartView.percent = 56
        
        self.view.addSubview(chartView)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        chartView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60).isActive = true
      //  chartView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        chartView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        chartView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
    }
    
    private func loadWorkStatusCollectionViewController() {
        
        self.view.addSubview(workStatusVC.collectionView)
        workStatusVC.collectionView.translatesAutoresizingMaskIntoConstraints = false

        workStatusVC.collectionView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 60).isActive = true
        workStatusVC.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        workStatusVC.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        workStatusVC.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true

        self.addChild(workStatusVC)

        workStatusVC.didMove(toParent: self)
        
        
//        workStatus.workItems = // 네트워크로 받은 데이터를 넣는다.
//        workStatus.collectionView.reloadData()
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupTitleDesign()
  
        makeOutline()
        
        loadDonutChartView()
        
        loadWorkStatusCollectionViewController()
 
        makeButtonMenu()
        
    }
    

  

}
