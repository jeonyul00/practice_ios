//
//  SheetViewController.swift
//  Sheet
//
//  Created by 전율 on 2024/06/13.
//

import UIKit
import MapKit

class SheetViewController: UIViewController {
        
    @IBOutlet weak var pinTitle: UILabel!
    @IBOutlet weak var pinSubtitle: UILabel!
    var closure: ((MKAnnotation) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    @IBAction func addPin(_ sender: Any) {
        let coordinate = CLLocationCoordinate2D(latitude: 37.7665, longitude: 126.7780) // 어디에 꽂을건지
        let annotation = MKPointAnnotation()
        annotation.title = "seoul"
        annotation.subtitle = "city"
        annotation.coordinate = coordinate
        closure?(annotation)
    }
    
}
