//
//  NewHotCell.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/08.
//

import UIKit
import AVKit

class NewHotCell: UITableViewCell {
    
    var baseContainerView:UIView = {
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.backgroundColor = .systemGray6
        return baseView
    }()
    
    var movieContainerView: UIView = {
        let movieView = UIView()
        movieView.translatesAutoresizingMaskIntoConstraints = false
        return movieView
    }()
    
    var thumbnail:UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        // test
        imgView.image = UIImage(systemName: "photo")
        imgView.clipsToBounds = true
        return imgView
    }()
    
    var titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var descriptionLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var dateLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    var movieResult:MovieResult? {
        didSet {
            settingPlayerURL()
            settingDate()
            settingTitle()
            settingDescription()
            requestThumbnail()
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 뷰를 올리고나서 contranints 설정해야함
        self.contentView.addSubview(baseContainerView)
        
        baseContainerView.addSubview(movieContainerView)
        baseContainerView.addSubview(thumbnail)
        baseContainerView.addSubview(titleLabel)
        baseContainerView.addSubview(descriptionLabel)
        baseContainerView.addSubview(dateLabel)
        
        addBaseView() // 기본 셀 컨텐츠뷰 베이스가 되는 뷰를 올림
        addMovieContainerView() // 무비 컨테이너
        addMoviewLayer() // 무비 레이어
        addThumbnil() // 썸네일
        addDateLabel() // 날짜
        addTitleLabel() // 제목
        addDescriptionLabel() // 설명
    }
    
    
    private func requestThumbnail(){
        if let hasURL = movieResult?.artworkUrl {
            NetworkLayer.request(urlString: hasURL) { img in
                DispatchQueue.main.async {
                    self.thumbnail.image = img
                }
                
            }
        }
    }
    
    private func settingDescription() {
        self.descriptionLabel.text = movieResult?.shortDescription
    }
    
    private func settingTitle() {
        self.titleLabel.text = movieResult?.trackName
    }
    
    private func settingDate() {
        // 국제 표준 시간으로 들어옴 -> 포맷 변경
        if let hasDate =  movieResult?.releaseDate {
            let formmater = ISO8601DateFormatter()
            if let isoDate =  formmater.date(from: hasDate) {
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy-MM-dd"
                let dateString = myFormatter.string(from: isoDate)
                self.dateLabel.text = dateString
            }
        }
    }
    
    private func settingPlayerURL(){
        if let previewURL =  movieResult?.previewUrl, let hasURL = URL(string: previewURL) {
            self.player = AVPlayer(url: hasURL)
            self.playerLayer.player = self.player
            self.player.volume = 0
            self.player.play()
        }
    }
    
    private func addDescriptionLabel(){
        descriptionLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor, constant: 0).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor, constant: -20).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: -30).isActive = true
    }
    
    private func addTitleLabel(){
        titleLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor, constant: 0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor, constant: -20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: baseContainerView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func addDateLabel(){
        dateLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor, constant: 0).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -10).isActive = true
    }
    
    private func addThumbnil(){
        thumbnail.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor, constant: 10).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: 80).isActive = true
        thumbnail.widthAnchor.constraint(equalToConstant: 50).isActive = true
        thumbnail.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10).isActive = true
    }
    
    private func addMoviewLayer(){
        movieContainerView.layer.addSublayer(playerLayer)
        playerLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 50 , height: 200)
    }
    
    private func addBaseView() {
        baseContainerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 50).isActive = true
        baseContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        baseContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        baseContainerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
    }
    
    private func addMovieContainerView() {
        movieContainerView.topAnchor.constraint(equalTo: baseContainerView.topAnchor).isActive = true
        movieContainerView.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor).isActive = true
        movieContainerView.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor).isActive = true
        movieContainerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        movieContainerView.bottomAnchor.constraint(equalTo:thumbnail.topAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
