//
//  ViewController.swift
//  Autolayout_Custom_Numpad_Lecture
//
//  Created by jhlee on 2023/09/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let numberPad1 = RandomNumberPadView(textField)
        textField.inputView = numberPad1
        
        let numberPad2 = RandomNumberPadView(textView)
        textView.inputView = numberPad2

        
    }


}

