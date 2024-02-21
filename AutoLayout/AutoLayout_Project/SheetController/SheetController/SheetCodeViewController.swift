//
//  SheetCodeViewController.swift
//  SheetController
//
//  Created by jhlee on 2023/06/20.
//

import UIKit
import MapKit

class SheetCodeViewController: UIViewController {

    // 버튼 1
    // 레이블 2
    // 스택뷰 (버튼, 레이블, 레이블)
    
    lazy var button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("add pin", for: .normal)
        button.addTarget(self, action: #selector(addPinInfo), for: .touchUpInside)
        return button
    }()
    
    
    let pinTitle: UILabel = {
       let label = UILabel()
        label.text = "title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pinSubTitle: UILabel = {
       let label = UILabel()
        label.text = "sub title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 30
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(pinTitle)
        stackView.addArrangedSubview(pinSubTitle)
        
        return stackView
    }()

    var addPin: ((MKAnnotation) -> Void)?
    
    @objc func addPinInfo() {
        let coordinate = CLLocationCoordinate2D(latitude: 37.57, longitude: 126.98)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate

        addPin?(annotation)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .orange
        self.view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                
        
    }
}
