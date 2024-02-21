//
//  RandomNumberPadView.swift
//  Autolayout_Custom_Numpad_Lecture
//
//  Created by jhlee on 2023/09/17.
//

import UIKit

class RandomNumberPadView: UIView {
    
    private func makeNumbers() -> [[String]]{
        var numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        numbers.shuffle()
        
        numbers.insert("done", at: numbers.count - 1)
        numbers.append("⌫")
        
        var rows = [[String]]()
        
        for sequence in stride(from: 0, to: numbers.count, by: 3) {
            var group = [String]()
            let end = sequence + 3
            
            if end < numbers.count {
                group = Array(numbers[sequence..<end])
            }else{
                group = Array(numbers[sequence..<numbers.count])
            }
            
            rows.append(group)
            
        }
        
        return rows
        
    }
    
    private var buttons = [NumberButton]()
    
    private func makeStackView(rows: [[String]]) {
        // [[1,2,3], [4,5,6], [7,8,9], [done, 10, ⌫]]
        var verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 15
        verticalStackView.distribution = .fillEqually
        
        for row in rows {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 15
            
            for numberString in row {
                let button = NumberButton()
                buttons.append(button)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                
                
                button.setTitle(numberString, for: .normal)
                
                rowStackView.addArrangedSubview(button)
            }
            
            verticalStackView.addArrangedSubview(rowStackView)
        }
        
        self.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        verticalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
    
    var keyInput: UIKeyInput?
    
    private func setupView() {
        self.backgroundColor = .white
        let rows = makeNumbers()
        makeStackView(rows: rows)
        
        if let tf = keyInput as? UITextField {
            tf.addTarget(self, action: #selector(inputDidBeginEditing), for: .editingDidBegin)
        }else if let tv = keyInput as? UITextView {
            NotificationCenter.default.addObserver(self, selector: #selector(inputDidBeginEditing), name: UITextView.textDidBeginEditingNotification, object: tv)
        }
        
    }
    @objc func inputDidBeginEditing(_ sender: Any) {
        // 패드를 섞기
        var rows = makeNumbers()
        
        for (index, button) in buttons.enumerated() {
           let idx = index % 3
            button.setTitle( rows.first?[idx], for: .normal)
//            buttons[index].setTitle( rows.first?[idx], for: .normal)
            if idx == 2 {
                rows.removeFirst()
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    init(_ keyInput: UIKeyInput) {
        self.keyInput = keyInput
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 250))
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {
            return
        }
        
        switch title {
        case "done" :
            (keyInput as? UIResponder)?.resignFirstResponder()
            
        case "⌫" :
            keyInput?.deleteBackward()
            
        default:
            keyInput?.insertText(title)
        }
        
    }
    
}
