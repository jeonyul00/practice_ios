//
//  MapViewController.swift
//  HelloLocation
//
//  Created by 전율 on 11/12/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        manager.stopUpdatingLocation()
    }

    
    func move(to location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func requestPreciseLocation(_ sender: Any) {
        if manager.accuracyAuthorization == .reducedAccuracy {
            manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "default")
            
        }
    }
    
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined: // 미선택
            manager.requestAlwaysAuthorization()
            break
        case .restricted, .denied:
            let alert = UIAlertController(title: "알림", message: "위치 서비스를 활성화시켜 주세요.", preferredStyle: .alert)
            let settingAction = UIAlertAction(title: "설정", style: .default) { _ in
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }
            let cacelAction = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(settingAction)
            alert.addAction(cacelAction)
            self.present(alert, animated: true)
            break
        case .authorizedAlways, .authorizedWhenInUse: // 사용중일떄만 허용: // 항상 허용
            manager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        let error = error as NSError
        guard error.code != CLError.Code.locationUnknown.rawValue else { return }
        print(error)
        manager.stopUpdatingLocation()
    }
    
    // 위치가 바뀔때마다 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currnetLocation = locations.last {
            move(to: currnetLocation)
        }
    }

    
}
