//
//  ViewController.swift
//  HelloLocation
//
//  Created by 전율 on 11/12/24.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        // 100미터 이상 움직였을 때 didUpdateLocations 호출
        manager.distanceFilter = 100
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    func reverseGeocode(location: CLLocation){
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location,preferredLocale: Locale(identifier: "ko_kr")) { placemarks, error in
            if let first = placemarks?.first {
                print(first.country)
                print(first.postalCode)
                print(first.administrativeArea)
                print(first.subAdministrativeArea)
                print(first.locality)
                print(first.subLocality)
                print(first.thoroughfare)
                print(first.subLocality)                
                self.adressLabel.text = first.name
            }
            
        }
        
    }
}

extension LocationViewController:CLLocationManagerDelegate {
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
            latitudeLabel.text = "\(currnetLocation.coordinate.latitude)"
            longitudeLabel.text = "\(currnetLocation.coordinate.longitude)"
            reverseGeocode(location: currnetLocation)
        }
     
    }
}
