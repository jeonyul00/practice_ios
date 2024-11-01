//
//  InOutViewModel.swift
//  Rx+MVVM
//
//  Created by 전율 on 2024/03/21.
//

import Foundation
import RxSwift
import RxCocoa

class InOutViewModel {
    
    let input = Input()
    let output = OutPut()
    private let disposeBag = DisposeBag()
    
    init() {
        Observable.combineLatest(input.email, input.password)
            .map { !$0.isEmpty && $1.count >= 6 }
            .bind(to: output.enableButton)
            .disposed(by: disposeBag)
        
        
        input.button.withLatestFrom(Observable.combineLatest(input.email, input.password))
            .bind { [weak self] email, password in
                
                if password.count < 6 {
                    self?.output.errorMsg.accept("6자리 이상 비밀번호를 입력해주세요.")
                } else {
                    self?.output.success.accept(())
                }
            }
            .disposed(by: disposeBag)
    }
    
}




extension InOutViewModel {
    
    struct Input {
        let email = PublishSubject<String>()
        let password = PublishSubject<String>()
        let button = PublishSubject<Void>()
    }
    
    struct OutPut {
        let enableButton = PublishRelay<Bool>()
        let errorMsg = PublishRelay<String>()
        let success = PublishRelay<Void>()
    }
    
}
