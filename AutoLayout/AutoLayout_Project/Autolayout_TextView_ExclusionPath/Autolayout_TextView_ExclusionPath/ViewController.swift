//
//  ViewController.swift
//  Autolayout_TextView_ExclusionPath
//
//  Created by jhlee on 2023/08/23.
//

import UIKit

class ViewController: UIViewController {

    let textView1 = CustomTextView(textViewType: .circleOutText)
    let textView2 = CustomTextView(textViewType: .circleInText)
    let textView3 = CustomTextView(textViewType: .circleInImage)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(textView1)
        self.view.addSubview(textView2)
        self.view.addSubview(textView3)


        textView1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        textView1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        textView1.bottomAnchor.constraint(equalTo: textView2.topAnchor).isActive = true

        textView2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        textView2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        textView2.bottomAnchor.constraint(equalTo: textView3.topAnchor).isActive = true

        textView3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        textView3.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        textView3.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//
//
        textView1.heightAnchor.constraint(equalTo: textView2.heightAnchor).isActive = true

        textView2.heightAnchor.constraint(equalTo: textView3.heightAnchor).isActive = true
 
    }


}

