//
//  ViewController.swift
//  Autolayout_Vertical_Bar_Graph
//
//  Created by jhlee on 2023/09/13.
//

import UIKit

class ViewController: UIViewController {

    let barGraphView = BarGraphView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barGraphView.backgroundColor = .orange
//        barGraphView.barPercents = [0.5, 0.6, 0.3, 0.7]
        
        self.view.addSubview(barGraphView)
        barGraphView.translatesAutoresizingMaskIntoConstraints = false
        
        barGraphView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        barGraphView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        barGraphView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        barGraphView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        

        let randomValueButton = UIButton()
        self.view.addSubview(randomValueButton)
        randomValueButton.translatesAutoresizingMaskIntoConstraints = false
        randomValueButton.rightAnchor.constraint(equalTo: barGraphView.rightAnchor).isActive = true
        randomValueButton.topAnchor.constraint(equalTo: barGraphView.bottomAnchor, constant: 30).isActive = true
        randomValueButton.setTitle("Random", for: .normal)
        randomValueButton.setTitleColor(.black, for: .normal)
        randomValueButton.addTarget(self, action: #selector(randomValue), for: .touchUpInside)
        
    }
    
    @objc func randomValue() {
        let randomValues = (0..<4).map { _ in
            CGFloat.random(in: 0...1)
        }
        barGraphView.barPercents = randomValues
        
    }


}

