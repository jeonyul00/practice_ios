//
//  ViewController.swift
//  Autolayout_VC_Transition
//
//  Created by jhlee on 2023/09/05.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedImage: UIImage?
    var selectedImageFrame: CGRect?
    
    var selectedLabelFrame: CGRect?
    var selectedString: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

 

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
        cell.leftImageView.image = UIImage(named: "fashion\(indexPath.row % 18 + 1)")
        cell.middleLabel.text = "Fashion \(indexPath.row + 1)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailVC.transitioningDelegate = self
        detailVC.modalPresentationStyle = .custom
        
        if let selectedCell = tableView.cellForRow(at: indexPath) as? ImageCell {
            detailVC.image = selectedCell.leftImageView.image
            
            self.selectedImage = selectedCell.leftImageView.image
            
            // 화면 전체를 잡고있는 뷰를 기준으로 선택한 이미지의 rect를 알고 싶을 때
            self.selectedImageFrame = selectedCell.leftImageView.convert(selectedCell.leftImageView.bounds, to: self.view)
            
            
            self.selectedLabelFrame = selectedCell.middleLabel.convert(selectedCell.middleLabel.bounds, to: self.view)
            
            self.selectedString = selectedCell.middleLabel.text
            
            detailVC.detailText = selectedCell.middleLabel.text
            
        }
 
        self.present(detailVC, animated: true)
        
    }
    
}

// model [data]
