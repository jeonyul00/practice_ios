//
//  TextInputViewController.swift
//  2Uikit
//
//  Created by 전율 on 2024/04/15.
//

import UIKit

class TextInputViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pwTextField.becomeFirstResponder() // 가상 키보드 올리기
        pwTextField.delegate = self
    }
}

extension TextInputViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("text is ::: ", textField.text!)
        return true
    }
    
    // 입력 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return false }
        guard let stringRange = Range(range,in:currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: string)
        // 5글자 까지만 받기
        if (changedText.count) > 5 {
            return false
        }
        return true
    }
    
    
}
