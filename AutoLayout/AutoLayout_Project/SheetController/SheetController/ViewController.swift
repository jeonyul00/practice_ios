//
//  ViewController.swift
//  SheetController
//
//  Created by jhlee on 2023/06/20.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    

//    let sheetVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SheetViewController") as! SheetViewController
    
    
    let sheetVC = SheetCodeViewController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
    }
    
    
    func makePin() {
        let coordinate = CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780)
        let annotation = MKPointAnnotation()
        annotation.title = "서울"
        annotation.subtitle = "서울의 어디"
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        // 핀이 있는곳으로 이동
        let regian = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(regian, animated: true)
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        makePin()

        
        sheetVC.addPin = { annotation in
            self.mapView.addAnnotation(annotation)
        }
      
        
        // 화면을 내려서 없애지 못하게 하는 옵션
        sheetVC.isModalInPresentation = true
        
        
        if let sheet = sheetVC.sheetPresentationController {
            
            let smallDetent = UISheetPresentationController.Detent.custom { _ in 150 }
            let smallDetent2 = UISheetPresentationController.Detent.custom { _ in 50 }

            // 멈춤쇠
            sheet.detents = [.large(), .medium(), smallDetent, smallDetent2]
            
            // 손잡이모양의 작은 바 디자인
            sheet.prefersGrabberVisible = true
            
            // 시트의 크기를 코드로 설정하고 싶다.
            sheet.selectedDetentIdentifier = smallDetent2.identifier
            
            // 부모뷰컨의 인터렉션 가능여부
            sheet.largestUndimmedDetentIdentifier = .large
        }
        
        
        
        self.present(sheetVC, animated: true)

    }


}



extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        sheetVC.pinTitle.text = annotation.title ?? ""
        sheetVC.pinSubTitle.text = annotation.subtitle ?? ""
        
    }
    
    
}
