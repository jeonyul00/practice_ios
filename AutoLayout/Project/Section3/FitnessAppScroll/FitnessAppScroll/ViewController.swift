//
//  ViewController.swift
//  FitnessAppScroll
//
//  Created by 전율 on 2024/06/04.
//

import UIKit

class ViewController: UIViewController {
    
    var planList = [PlanList]() {
        didSet {
            if fitnessViewList.isEmpty {
                var fvList = [FitnessView]()
                (0..<planList.count).forEach { num in
                    let fv = FitnessView()
                    fvList.append(fv)
                }
                fitnessViewList  = fvList
            }
                        
            stackView.arrangedSubviews.forEach { view in
                stackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
            
            fitnessViewList.forEach { view in
                view.heightAnchor.constraint(equalToConstant: 150).isActive = true
                stackView.addArrangedSubview(view)
            }
            
            for (idx,view) in fitnessViewList.enumerated() {
                view.bgImageView.image = UIImage(named: planList[idx].imageName)
                view.fitnessTitle.text = planList[idx].planType
            }
        }
    }
    
    let scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var fitnessViewList = [FitnessView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        // !!!!!!!!!!!!!!!!!!!!!! 스크롤뷰 콘텐츠 레이아우스 프레임 레이아웃
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
        loadJsonData()
        
    }
    
    func loadJsonData(){
        guard let plans = plans else { return }
        do {
            planList = try JSONDecoder().decode([PlanList].self, from: plans)
        } catch {
            print(error)
        }
    }
    
}

