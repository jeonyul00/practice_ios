//
//  ViewController.swift
//  Fitness_TableView
//
//  Created by jhlee on 2023/05/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var store: UILabel! {
        didSet{
            store.font = UIFont.systemFont(ofSize: 30)
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    var planList: [PlanList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.tintColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadJsonData()
    }
    
    private func loadJsonData() {
        guard let plans = plans else { return }
        
        // 디코딩
        let decoder = JSONDecoder()
        
        do{
            planList = try decoder.decode([PlanList].self, from: plans)
            tableView.reloadData()
        }catch{
            print(error.localizedDescription)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planList?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FitnessCell", for: indexPath) as! FitnessCell
        
        
        cell.plan = planList?[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailVC.selectedPlan = planList?[indexPath.row]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
  
    
    
}

