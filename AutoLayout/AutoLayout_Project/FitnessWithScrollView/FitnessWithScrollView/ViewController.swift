//
//  ViewController.swift
//  FitnessWithScrollView
//
//  Created by jhlee on 2023/07/16.
//

import UIKit

class ViewController: UIViewController {
    
    var planList = [PlanList]() {
        didSet {
            
//            if fitnessViewList.isEmpty {
                var fvList = [FitnessView]()
                
                (0..<planList.count).forEach { index in
                    let fv = FitnessView()
                    fvList.append(fv)
                }
                fitnessViewList = fvList
//            }
            
            
            stackView.arrangedSubviews.forEach { view in
                stackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
            
            fitnessViewList.forEach { fv in
                fv.heightAnchor.constraint(equalToConstant: 150).isActive = true
                stackView.addArrangedSubview(fv)
                
            }
            
            for (index, fv) in fitnessViewList.enumerated() {
                fv.bgImageView.image = UIImage(named: planList[index].imageName)
                
                fv.fitnessTitle.text = planList[index].planType
            }
        }
    }
    
    
    let scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .yellow
        return scrollView
        
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()
    
    
    var fitnessViewList = [FitnessView]()
    
    func loadJsonData() {
        guard let plans = plans else { return }
        
        let decoder = JSONDecoder()
        do{
            planList = try decoder.decode([PlanList].self, from: plans)
        }catch{
            print("error", error)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        
        
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        
        scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
        
        loadJsonData()
        
    }
    
    
}

