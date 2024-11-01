//
//  ViewModel.swift
//  Rx+MVVM
//
//  Created by 전율 on 2024/03/21.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    struct Input {
        let tap: Observable<Void>
    }
    
    struct Output {
        let result: Observable<String>
    }
    
    func transform(input: Input) -> Output {
           let result = input.tap
               .map { _ in "버튼이 눌렸습니다!" }
           return Output(result: result)
       }
}
