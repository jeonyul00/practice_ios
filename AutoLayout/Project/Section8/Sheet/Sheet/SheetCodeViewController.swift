//
//  SheetCodeViewController.swift
//  Sheet
//
//  Created by 전율 on 6/28/24.
//

import UIKit
import MapKit

class SheetCodeViewController: UIViewController {
    
    let button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("button", for: .normal)
        btn.addTarget(self, action: #selector(addPinInfo), for: .touchUpInside)
        return btn
    }()
    
    let pinTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "title"
        return label
    }()
    
    let pinSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "sub"
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(pinTitle)
        stackView.addArrangedSubview(pinSubtitle)
        return stackView
    }()
    
    var closure: ((MKAnnotation)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    @objc func addPinInfo(){
        let coordinate = CLLocationCoordinate2D(latitude: 37.7665, longitude: 126.7780)
        let annotation = MKPointAnnotation()
        annotation.title = "seoul"
        annotation.subtitle = "city"
        annotation.coordinate = coordinate
        closure?(annotation)
    }
}
