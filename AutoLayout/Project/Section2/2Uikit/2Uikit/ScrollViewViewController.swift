//
//  ScrollViewViewController.swift
//  2Uikit
//
//  Created by 전율 on 2024/03/18.
//

import UIKit

class ScrollViewViewController: UIViewController {
    
    let imageView:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "bgV1.png")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGray
        return scrollView
    }()
    
    let contentView:UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label1: UILabel = {
        let lbl = UILabel()
        lbl.text = "test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let label2: UILabel = {
        let lbl = UILabel()
        lbl.text = "test2"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setLayout()
        setLayout2()
    }
    
    func setLayout2(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // 가로 스클롤 중단
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        
        // 이거나
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        //        이거나 똑같은거 아닌가? ㅇㅇ 똑같음
        //        self.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        //        self.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        //        self.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        //        self.view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        
        
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        
        label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        label1.bottomAnchor.constraint(equalTo: label2.topAnchor, constant: -30).isActive = true
        label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        label2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        
    }
    
    func setLayout(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        
    }
    
}
