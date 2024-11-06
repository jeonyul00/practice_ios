//
//  ViewController.swift
//  HelloConcurrency
//
//  Created by 전율 on 11/6/24.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    let downloader = VideoDowonloader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func download(_ sender: Any) {
        resultLabel.text = "ing..."
        // sync 1
        //        do {
        //            let url = try downloader.download()
        //            resultLabel.text = "success"
        //            let vc = AVPlayerViewController()
        //            vc.player = AVPlayer(url: url)
        //            present(vc, animated: true) {
        //                vc.player?.play()
        //            }
        //        } catch {
        //            resultLabel.text = error.localizedDescription
        //        }
        
        
        // GCD 2
        //        downloader.download { [weak self] result in
        //            switch result {
        //            case .success(let url):
        //                let vc = AVPlayerViewController()
        //                vc.player = AVPlayer(url: url)
        //                self?.present(vc, animated: true) {
        //                    vc.player?.play()
        //                }
        //            case .failure(let error):
        //                self?.resultLabel.text = error.localizedDescription
        //            }
        //        }
        
        
        // async 3
        Task {
            do {
                let url = try await downloader.download()
                resultLabel.text = "success"
                let vc = AVPlayerViewController()
                vc.player = AVPlayer(url: url)
                present(vc, animated: true) {
                    vc.player?.play()
                }
            } catch {
                resultLabel.text = error.localizedDescription
            }
        }
        
        
        
    }
    
    
    
    
    
}

