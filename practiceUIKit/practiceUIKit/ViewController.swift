//
//  ViewController.swift
//  practiceUIKit
//
//  Created by 전율 on 2023/12/20.
//

import UIKit

protocol AdminDelegate {
    func doTask()
}

class ViewController: UIViewController,AdminDelegate {
    
    func doTask() {
        print("task")
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell
    }
    
    
}
