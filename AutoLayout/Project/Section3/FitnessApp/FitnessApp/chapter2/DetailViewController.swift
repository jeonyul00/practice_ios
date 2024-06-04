//
//  DetailViewController.swift
//  FitnessApp
//
//  Created by 전율 on 2024/05/30.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedPlan:PlanList? {
        didSet {
            let imgName = selectedPlan?.imageName ?? ""
            let filePath = Bundle.main.path(forResource: "Fitness/\(imgName)", ofType: nil) ?? ""
            BGImageView.image = UIImage(named: filePath)
            planTitle.text = selectedPlan?.planType
            planDescription.text = selectedPlan?.description
        }
    }
    
    var BGImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    var planTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 30)
        lbl.textColor = .white
        return lbl
    }()
    
    var planDescription: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var leftButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.plain()
        
        // DetailViewController.self: 이 함수가 어디있냐?
        btn.addTarget(self, action: #selector(runLeftButton), for: .touchUpInside)
        return btn
    }()
    
    let rightButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func runLeftButton(){ print("left button") }
    
    func capsultButtonConfig(_ title:String) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.baseForegroundColor = .white
        config.background.strokeWidth = 2
        config.background.strokeColor = .white
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .clear
        return config
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let barAppearance = UINavigationBarAppearance()
        // 백그라운드 투명하게
        barAppearance.configureWithTransparentBackground()
        
        barAppearance.setBackIndicatorImage(UIImage(systemName: "chevron.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal), transitionMaskImage: UIImage(systemName: "chevron.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal))
        
        self.navigationController?.navigationBar.compactAppearance = barAppearance
        self.navigationController?.navigationBar.standardAppearance = barAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        self.navigationController?.navigationBar.compactScrollEdgeAppearance = barAppearance
        
        let itemAppearnce = UIBarButtonItemAppearance()
        itemAppearnce.normal.titleTextAttributes = [.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.compactAppearance?.backButtonAppearance = itemAppearnce
        self.navigationController?.navigationBar.standardAppearance.backButtonAppearance = itemAppearnce
        self.navigationController?.navigationBar.scrollEdgeAppearance?.backButtonAppearance = itemAppearnce
        self.navigationController?.navigationBar.compactScrollEdgeAppearance?.backButtonAppearance = itemAppearnce
        
        leftButton.configuration = capsultButtonConfig("left")
        rightButton.configuration = capsultButtonConfig("right")
        
        configBG()
        configLabels()
        configButtons()
        
    }
    
    func configButtons() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        // addArrangedSubview: stackView에 올리기
        stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(rightButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        self.view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        
    }
    
    func configLabels() {
        let labelStackView = UIStackView()
        labelStackView.axis = .vertical
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.spacing = 20
        labelStackView.addArrangedSubview(planTitle)
        labelStackView.addArrangedSubview(planDescription)
        
        self.view.addSubview(labelStackView)
        
        labelStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20).isActive = true
        // 수치로 값 설정
        // labelStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: 100).isActive = true
        // 비율로 값 설정: multiplier
        NSLayoutConstraint(item: labelStackView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.25, constant: 0).isActive = true
    }
    
    func configBG(){
        self.view.addSubview(BGImageView)
        BGImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        BGImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        BGImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        BGImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
    
    
}
