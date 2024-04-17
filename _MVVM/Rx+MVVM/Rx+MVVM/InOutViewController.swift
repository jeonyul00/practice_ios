import UIKit
import RxSwift
import RxCocoa

class InOutViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
        
    private let viewModel = InOutViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.input.email)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.input.password)
            .disposed(by: disposeBag)
                
        loginButton.rx.tap
            .bind(to: viewModel.input.button)
            .disposed(by: disposeBag)
                
        viewModel.output.enableButton
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.output.errorMsg
            .bind(to: errorMessageLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.output.success
            .subscribe(onNext: { [weak self] in
                self?.showSuccessAlert()
            })
            .disposed(by: disposeBag)
    }
    
    private func showSuccessAlert() {
        let alert = UIAlertController(title: "성공", message: "로그인에 성공했습니다!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
