//
//  DetailViewController.swift
//  Fitness_TableView
//
//  Created by jhlee on 2023/05/19.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var planImageView: UIImageView!
    @IBOutlet private weak var planDescription: UILabel!
    @IBOutlet private weak var planTitle: UILabel!
    
    var selectedPlan: PlanList? {
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        planTitle.text = selectedPlan?.planType
        planDescription.text = selectedPlan?.description
        
        let imageName = selectedPlan?.imageName ?? ""
        planImageView.image = UIImage(named: imageName)

        
        // Do any additional setup after loading the view.
    }



}
