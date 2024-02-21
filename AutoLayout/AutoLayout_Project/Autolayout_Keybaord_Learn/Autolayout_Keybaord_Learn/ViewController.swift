//
//  ViewController.swift
//  Autolayout_Keybaord_Learn
//
//  Created by jhlee on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textViewBottomMargin: NSLayoutConstraint!
    
    
    @IBOutlet weak var textView: UITextView!
    
    private var isON = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
       // 0.25
        guard let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        
        if isON {
            UIView.animate(withDuration: animationDuration) {
                self.textViewBottomMargin.constant = keyboardFrame.height
                self.view.layoutIfNeeded()
            }

        }else{
            self.textView.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.height)
        }
        
    }
    
    
    @IBAction func changeStyle(_ sender: UISwitch) {
        isON = sender.isOn
    }
    
    
    @IBAction func hideKeyboard(_ sender: Any) {
        textView.resignFirstResponder()
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        
        guard let userInfo = notification.userInfo else { return }

        
       // 0.25
        guard let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }

        if isON {
            UIView.animate(withDuration: animationDuration) {
                self.textViewBottomMargin.constant = 30
                self.view.layoutIfNeeded()
            }

        }else{
            self.textView.transform = .identity

        }

    }


}

