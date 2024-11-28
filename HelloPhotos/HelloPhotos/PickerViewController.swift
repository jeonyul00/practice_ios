//
//  PickerViewController.swift
//  HelloPhotos
//
//  Created by 전율 on 11/28/24.
//

import UIKit
import PhotosUI

class PickerViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pick(_ sender: Any) {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = .images
        configuration.preferredAssetRepresentationMode = .current
        if #available(iOS 17, *) {
            configuration.disabledCapabilities = [.collectionNavigation, .sensitivityAnalysisIntervention]
        }
        
        configuration.selectionLimit = 10
        configuration.selection = .ordered
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
}

extension PickerViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if let first = results.first {
            if first.itemProvider.canLoadObject(ofClass: UIImage.self) {
                first.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    DispatchQueue.main.async {
                        self?.imageView.image = image as? UIImage
                    }
                }
            }
        }
        
        if results.count <= 10 || results.isEmpty {
            picker.dismiss(animated: true)
        }
        
    }
}
