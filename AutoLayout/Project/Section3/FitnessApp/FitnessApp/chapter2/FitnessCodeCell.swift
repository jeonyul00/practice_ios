//
//  FitnessCodeCell.swift
//  FitnessApp
//
//  Created by 전율 on 2024/05/27.
//

import UIKit

class FitnessCodeCell: UITableViewCell {
    
    var planLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    var bgImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: "photo")
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true // 바깥으로 넘어가는 부분 자르기
        return imgView
    }()
    
    // 스토리보드나 xib를 사용했을 때 호출됨, 지금은 호출이 안된다는거지
    override func awakeFromNib() { super.awakeFromNib() }
    
    // code 기반이면 이걸 호출해야됨
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addBG()
        addPlanLabel()
    }
    
    func addPlanLabel() {
        self.contentView.addSubview(planLabel)
        planLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        planLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    func addBG() {
        self.contentView.addSubview(bgImgView)
        bgImgView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        bgImgView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        bgImgView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        bgImgView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    // 위에꺼 쓰려면 이것도 반드시 구현해야 함, 이것도 xib 파일이 있어야 호출이됨
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
