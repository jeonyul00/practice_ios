//
//  ViewController.swift
//  FitnessApp
//
//  Created by 전율 on 2024/05/27.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var planList:[PlanList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        registTableView()
    }
    
    func registTableView(){
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        tableView.register(FitnessCodeCell.self, forCellReuseIdentifier: "FitnessCodeCell")
        loadJsonData()
    }
    
    
    func loadJsonData() {
        guard let plans = plans else { return }
        let decoder = JSONDecoder()
        do {
            planList = try decoder.decode([PlanList].self, from: plans)
            tableView.reloadData()
        } catch {
            print(error)
        }
        
    }
}


extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FitnessCodeCell", for: indexPath) as! FitnessCodeCell
        let imgName = planList?[indexPath.row].imageName ?? ""
        let filePath = Bundle.main.path(forResource: "Fitness/\(imgName)", ofType: nil) ?? ""
        cell.bgImgView.image = UIImage(named: filePath)
        cell.planLabel.text = planList?[indexPath.row].planType
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        //        let selectedPlan = planList?[indexPath.row]
        //        let imgName = selectedPlan?.imageName ?? ""
        //        let filePath = Bundle.main.path(forResource: "Fitness/\(imgName)", ofType: nil) ?? ""
        vc.selectedPlan = planList?[indexPath.row]
        //        vc.BGImageView.image = UIImage(named: filePath)
        //        vc.planTitle.text = selectedPlan?.planType
        //        vc.planDescription.text = selectedPlan?.description
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
