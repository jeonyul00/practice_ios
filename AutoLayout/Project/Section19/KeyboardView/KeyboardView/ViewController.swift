//
//  ViewController.swift
//  KeyboardView
//
//  Created by 전율 on 6/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottoMargin: NSLayoutConstraint!
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @IBAction func changeStyle(_ sender: UISwitch) {
        isOn = sender.isOn
    }
    
    
    
    @objc func showKeyboard(notification: Notification) {
        if let userInfo = notification.userInfo {
            // keyboardFrameEndUserInfoKey : 키보드의 최종 위치와 크기 정보
            guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            
            // 애니메이션
            guard let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
            
            
            if isOn {
                UIView.animate(withDuration: animationDuration) {
                    self.bottoMargin.constant = keyboardFrame.height + 30
                    self.view.layoutIfNeeded()
                }
            } else {
                self.textView.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.height + 30 )
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        textView.resignFirstResponder() // 키보드 내리기
    }
    
    @objc func hideKeyboard(notification: Notification) {
        if let userInfo = notification.userInfo {
            // keyboardFrameEndUserInfoKey : 키보드의 최종 위치와 크기 정보
            guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            
            // 0.25초 애니메이션
            guard let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
            
            
            if isOn {
                UIView.animate(withDuration: animationDuration) {
                    self.bottoMargin.constant = 30
                    self.view.layoutIfNeeded()
                }
            } else {
                // .identity : 트랜스폼 변경 이전의 상태
                self.textView.transform = .identity
                self.view.layoutIfNeeded()

            }
        }
        
        
        
    }
    
}

