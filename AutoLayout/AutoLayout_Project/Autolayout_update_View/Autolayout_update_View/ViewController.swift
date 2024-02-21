//
//  ViewController.swift
//  Autolayout_update_View
//
//  Created by jhlee on 2023/08/15.
//

import UIKit

class ViewController: UIViewController {

    let graphView = GraphView()
    
    
    @IBAction func addGraph(_ sender: Any) {
        let random = CGFloat.random(in: 0...1)
        print(random)
        self.graphView.percentages.append(random)

    }
    
    @IBAction func reset(_ sender: Any) {
        self.graphView.percentages.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
            self.view.addSubview(self.graphView)

            self.graphView.translatesAutoresizingMaskIntoConstraints = false

            self.graphView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
            self.graphView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true

            self.graphView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

            self.graphView.heightAnchor.constraint(equalToConstant: 100).isActive = true

       
        
        graphView.backgroundColor = .lightGray
        


        
        
        
    }


}

