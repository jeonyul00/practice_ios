//
//  ViewController.swift
//  Login
//
//  Created by 전율 on 11/1/24.
//

import UIKit
import Security

class ViewController: UIViewController {
    
    // 아이디와 비밀번호 텍스트 필드 생성
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // 로그인 버튼 생성
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // UI 요소들 추가
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        // 레이아웃 설정
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20)
        ])
        
        if let id = loadFromKeychain(key: "id") {
            usernameTextField.text = id
            usernameTextField.text = loadFromKeychain(key: id)
        }
    }
    
    func loadFromKeychain(key:String)-> String? {
        let query = [
            kSecClass:kSecClassGenericPassword,
            kSecAttrAccount:key,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary
        
        var data: AnyObject? = nil
        let result = SecItemCopyMatching(query, &data)
        guard result == errSecSuccess else { return nil }
        guard let data = data as? Data, let value = String(data: data, encoding: .utf8) else { return nil }
        return value
    }
    
    func saveToKeychain(key:String, value:String) {
        // 이게 뭔데...?
        let query = [
            kSecClass:kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: value.data(using: .utf8) as Any
        ] as CFDictionary // core found dictionary
        
        SecItemDelete(query)
        
        let result = SecItemAdd(query, nil)
        
        if result == errSecSuccess {
            print("저장 성공")
        } else {
            print("저장 실패")
        }
    }
    
    @objc func loginButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "아이디와 비밀번호를 입력해주세요.")
            return
        }
        saveToKeychain(key: "id", value: username)
        saveToKeychain(key: username, value: password)
        
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
