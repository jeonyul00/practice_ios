//
//  ViewController.swift
//  Rx+MVVM
//
//  Created by 전율 on 2024/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    // 1. 관찰 가능하면서, 관찰자의 역할도 하는 서브젝트 생성
    // let publishSubject = PublishSubject<String>()
    // let relay = BehaviorRelay<String>(value: "hi")
    
    var viewModel: ViewModel!
    let disposeBag = DisposeBag()
    let button = UIButton(type: .system)
    let label = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        Observable.of(1, 2, 3).subscribe { num in
        //            // print(num)
        //        } onError: { error in
        //            print(error)
        //        } onCompleted: {
        //            print("completed")
        //        }.dispose()
        
        //
        //        let observable = Observable.create { observer in
        //            observer.onNext("1")
        //            observer.onCompleted()
        //            return Disposables.create()
        //        }.subscribe { string in
        //            print(string)
        //        }
        //        observable.dispose()
        
        // 2. 서브젝트를 구독(관찰 가능하도록)한 후 값이 바뀌면 프린트 이벤트 호출, 옵저버로서의 역할
        // publishSubject.subscribe { event in
        //    print(event)
        // }
        
        // relay.subscribe { event in
        //     print(event)
        // }
        
        // 3. 관차 가능한 값을 등록, 옵저버블로서의 역할
        // publishSubject.onNext("Hello")
        // publishSubject.onNext("World")
        
        //relay.accept("hi2")
        setupUI()
        bindViewModel()
    }
    func setupUI() {
        button.setTitle("Tap Me", for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        label.text = "결과가 여기에 표시됩니다."
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
    }
    
    func bindViewModel() {
        viewModel = ViewModel()
        
        // 버틑을 관찰 가능한 형태로 만든 후에 ViewModel의 Input 안의 tap에 할당
        let input = ViewModel.Input(tap: button.rx.tap.asObservable())
        // Input.tap 타입의 관찰 가능한 값을 transform함수의 인자로 전달하고 그 반환값을 output에 할당
        let output = viewModel.transform(input: input)
        // 반환받은 값 ("버튼이 눌렸습니다!")를 label.rx.text에 바인딩
        output.result
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }

}
