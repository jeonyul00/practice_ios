//
//  ViewController.swift
//  ImageLoad_ProgressBar
//
//  Created by jhlee on 2023/08/20.
//

import UIKit

// image url

// https://www.nasa.gov/sites/default/files/thumbnails/image/stsci-01h6c42211pd8xxd6a7vq3330n.png



class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var progressBarView = ProgressBarView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.backgroundColor = .lightGray
        
        
        self.view.addSubview(progressBarView)
        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        
        progressBarView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
//        progressBarView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        progressBarView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        
        progressBarView.bottomAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        
        progressBarView.heightAnchor.constraint(equalToConstant: 100).isActive
         = true
        
        
    }

    @IBAction func loadImage(_ sender: Any) {
        loadImageFromURL()
    }
    
    @IBAction func reset(_ sender: Any) {
        imageView.image = nil
        progressBarView.rate = 0
    }
    
    func loadImageFromURL() {
        let imageURLString = "https://www.nasa.gov/sites/default/files/thumbnails/image/stsci-01h6c42211pd8xxd6a7vq3330n.png"
        
            if let url = URL(string: imageURLString) {
            
            let config = URLSessionConfiguration.default
            
            let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
            
            session.downloadTask(with: url).resume()
 
        }
    }
    

}
                   
extension ViewController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        self.progressBarView.rate = progress
      

        
        
//        print("totalBytesWritten", totalBytesWritten)
//        print("progress", progress)
    }
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        do{
            let data = try Data(contentsOf: location)
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }

        }catch{
            
        }
        
    }
    
            
}

