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
    // let sheetVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SheetViewController") as! SheetViewController
    let sheetVC = SheetCodeViewController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
    }
    
    func makePin() {
        let coordinate = CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780) // 어디에 꽂을건지
        let annotation = MKPointAnnotation()
        
        annotation.title = "seoul"
        annotation.subtitle = "city"
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        // 핀으로 포커스 이동
        let regin = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(regin, animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        makePin() // pin
        
        // 클로저
        sheetVC.closure = { [weak self] annotation in self?.mapView.addAnnotation(annotation) }
        
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


extension ViewController:MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        sheetVC.pinTitle.text = annotation.title ?? ""
        sheetVC.pinSubtitle.text  = annotation.subtitle ?? ""
    
    }
}
