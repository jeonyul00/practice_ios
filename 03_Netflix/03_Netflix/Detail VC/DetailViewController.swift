//
//  DetailViewController.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/09.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var movieContainerView: UIView!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieDescription: UILabel!
    
    private var player = AVPlayer()
    private let playerLayer = AVPlayerLayer()
    private var loadedViewAndDataSet:(()->Void)?
    
    var movieResult:MovieResult? {
        didSet {
            loadedViewAndDataSet = { [weak self] in // 약한 참조 캡쳐
                guard let self = self else { return }
                self.movieDescription.text = self.movieResult?.longDescription
                self.movieTitle.text = self.movieResult?.trackName
                if let previewURL =  self.movieResult?.previewUrl, let url = URL(string: previewURL) {
                    self.playMovie(url: url)
                }
            }
        }
    }
    
    deinit {
        print("memory deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieContainerView.layer.addSublayer(playerLayer) // view를 올리는게 아니고 레이어를 올리는거다
        playerLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        loadedViewAndDataSet?()
        loadedViewAndDataSet = nil // 참조 제거를 명시하거나, 애초에 약한 참조를 하거나 -> 여기서는 둘 다 쓰겠다 실무에서는 그러지마
    }
    
    
    @IBAction func play(_ sender: Any) {
        if player.timeControlStatus != .playing {
            player.volume = 0.1
            player.play()
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        player.pause()
    }
    
    private func playMovie(url:URL) {
        player = AVPlayer(url: url)
        playerLayer.player = player
        player.volume = 0.1
        player.play()
    }
}
