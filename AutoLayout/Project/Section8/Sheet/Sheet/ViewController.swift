//
//  ViewController.swift
//  Sheet
//
//  Created by 전율 on 2024/06/13.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }

    override func viewDidAppear(_ animated: Bool) {
        let sheetVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SheetViewController") as! SheetViewController
        
        // 시트 못없애도록 (시트를 내려도 없애지 못함)
        sheetVC.isModalInPresentation = true
                
        if let sheet = sheetVC.sheetPresentationController {
            // 작은 사이즈
            let smallDetent = UISheetPresentationController.Detent.custom { _ in 150 }
            // 사이즈 걸림쇠
            sheet.detents = [.medium(), .large(),smallDetent]
            // 손잡이?
            sheet.prefersGrabberVisible = true
            // 최초 화면 사이즈
            sheet.selectedDetentIdentifier = smallDetent.identifier
            // 백그라운드 지도 컨트롤 가능하도록 설정 => .large 사이즈 이하까지는 (언딘드하겠다 == 어둡게하지 않겠다.) 컨트롤을 할 수 있도록 하겠다
            sheet.largestUndimmedDetentIdentifier = .large
        }
        
        self.present(sheetVC, animated: true)
        
    }

}

