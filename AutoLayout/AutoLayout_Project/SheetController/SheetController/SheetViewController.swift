//
//  SheetViewController.swift
//  SheetController
//
//  Created by jhlee on 2023/06/20.
//

import UIKit
import MapKit

class SheetViewController: UIViewController {

    @IBOutlet weak var pinSubTitle: UILabel!
    @IBOutlet weak var pinTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    var addPin: ((MKAnnotation) -> Void)?
    
    @IBAction private func addPin(_ sender: Any) {
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.57, longitude: 126.98)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate

        addPin?(annotation)
    }
    

}
