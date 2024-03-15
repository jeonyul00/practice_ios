//
//  HuggingPriorityViewController.swift
//  Base
//
//  Created by 전율 on 2024/03/15.
//

import UIKit

class HuggingPriorityViewController: UIViewController {
    
    let label1:UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "label 1"
        return label
    }()
    
    let label2:UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange       
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "label 2"
        return label
    }()
    
    let label3:UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "label 33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333"
        return label
    }()
    
    let label4:UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "label 4"
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setLayout(){
        self.view.addSubview(label1)
        self.view.addSubview(label2)
        self.view.addSubview(label3)
        self.view.addSubview(label4)
        label1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        label1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 30).isActive = true
        label1.trailingAnchor.constraint(equalTo: label2.leadingAnchor, constant: -30).isActive = true
        label2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        label2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        // 👆 이게 왜 에러가 아니지 hugging 우선순위가 츙돌나는데 -> 코드로 치면 그렀다네
        label1.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        label2.setContentHuggingPriority(UILayoutPriority(249), for: .horizontal)
        // 👆 이래야 의도대로 되지
        
        label3.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30).isActive = true
        label3.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        

        // let label3Trailing = label4.leadingAnchor.constraint(equalTo: label3.trailingAnchor, constant: 30)
        let label3Trailing = label3.trailingAnchor.constraint(equalTo: label4.leadingAnchor, constant: -30)
        
        label3Trailing.priority = UILayoutPriority(1)// 사이의 priority
        label3Trailing.isActive = true
        
        label4.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30).isActive = true
        label4.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        label3.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
        label3.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
