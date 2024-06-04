////
////  DetailViewController.swift
////  FitnessApp
////
////  Created by 전율 on 2024/05/27.
////
//
//import UIKit
//
//class DetailViewController: UIViewController {
//
//    @IBOutlet weak var planImgView: UIImageView!
//    @IBOutlet weak var planTitle: UILabel!
//    @IBOutlet weak var planDescription: UILabel!
//    
//    var selectedPlan: PlanList?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.navigationController?.navigationBar.tintColor = .white
//
//        planTitle.text = selectedPlan?.planType
//        planDescription.text = selectedPlan?.description
//        let imgName = selectedPlan?.imageName ?? ""
//        let filePath = Bundle.main.path(forResource: "Fitness/\(imgName)", ofType: nil) ?? ""
//        if let image = UIImage(contentsOfFile: filePath) {
//            planImgView.image = image
//        } else {
//            print("Image not found at path: \(filePath)")
//        }
//    }
//
//
//    
//}
