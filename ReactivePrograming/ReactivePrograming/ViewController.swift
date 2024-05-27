//
//  ViewController.swift
//  ReactivePrograming
//
//  Created by 전율 on 2024/05/08.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    let button:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Click Me", for: .normal)
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    let obseverble1 = Observable<[Int]>.just([123]) // [1,2,3]
    let obseverble2 = Observable<[Int]>.of([1,2,3]) // [1,2,3]
    let obseverble3 = Observable<Int>.from([1,2,3]) // 1, 2, 3 only array
    let obseverble = Observable.create { observer in
        observer.onNext("first emit")
        observer.onNext("second emit")
        observer.onCompleted()
        observer.onNext("third emit")
        return Disposables.create()
        
    }
    
    lazy var observer = obseverble.subscribe { string in
        print(string)
    } onError: { error in
        print(error)
    } onCompleted: {
        print("finish")
    }
    
    let subject = PublishSubject<String>()
                    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(button)
        setupButtonConstraints()
        // ---
        button.rx.tap.subscribe(onNext: {
            print("Observable이 항목을 방출 했다!")
        },
                                onError: { error in
            print("에러가 발생 했다!")
        },
                                onCompleted: {
            print("해당 이벤트가 끝났다!")
        }).disposed(by: disposeBag)
        // ---
        
        obseverble3.subscribe { element in
            print(element)
        } onError: { error in
            print(error)
        }.disposed(by: disposeBag)
        
        observer.dispose()
        
        let dispose = subject.subscribe { string in
            print("첫번째 Observer가 받는 항목 ::: ",string)
        }
        
        subject.onNext("1")
        subject.onNext("2")
        
        subject.subscribe(onNext: {
            print("두번째 Observer가 받는 항목 : \($0)")
        }).disposed(by: disposeBag)
         
        subject.onNext("3")


        
    }
    
    func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
