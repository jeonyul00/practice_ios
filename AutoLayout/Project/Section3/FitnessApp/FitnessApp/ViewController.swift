//
//  ViewController.swift
//  FitnessApp
//
//  Created by 전율 on 2024/05/27.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        registTableView()
    }
    
    func registTableView(){
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        //        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        //        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        //        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // tableView에 cell 등록, 0번 인덱스 -> cellClass
        tableView.register(FitnessCodeCell.self, forCellReuseIdentifier: "FitnessCodeCell")
    }
}


extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FitnessCodeCell", for: indexPath) as! FitnessCodeCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
