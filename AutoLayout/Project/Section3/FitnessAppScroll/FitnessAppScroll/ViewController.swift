//
//  ViewController.swift
//  FitnessAppScroll
//
//  Created by 전율 on 2024/06/04.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView:UIScrollView = {
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
    
    let fitnessViewList:[FitnessView] = {
        var fvList = [FitnessView]()
        (0..<10).forEach { num in
            let fv = FitnessView()
            fvList.append(fv)
        }
        return fvList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        fitnessViewList.forEach { view in
            view.heightAnchor.constraint(equalToConstant: 150).isActive = true
            stackView.addArrangedSubview(view)
        }
        
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        // !!!!!!!!!!!!!!!!!!!!!!
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
        
    }

}

