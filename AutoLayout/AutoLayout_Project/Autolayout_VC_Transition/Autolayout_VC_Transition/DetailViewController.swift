//
//  DetailViewController.swift
//  Autolayout_VC_Transition
//
//  Created by jhlee on 2023/09/06.
//

import UIKit

class DetailViewController: UIViewController {

 
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var bigImageView: UIImageView! {
        didSet{
            bigImageView.contentMode = .scaleAspectFill
        }
    }
    
    var image: UIImage?
    
    var detailText: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = detailText
        bigImageView.image = image

    }
    
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
 

}
