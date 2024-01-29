//
//  ViewController.swift
//  01_RxSwift
//
//  Created by 전율 on 2024/01/25.
//

import UIKit
import RxSwift
import RxCocoa

/*
 Observable: 관찰 가능한 순차적인 형태, 비동기 이벤트에 대해 관찰 가능한 형태로 만든다. => 관찰이 가능한 흐름으로 비동기 이벤트의 시퀀스를 생성할 수 있는 대상
 Observer: 이벤트의 변화를 관찰하여 전파 받는 객체, Observable를 쳐다보고 있다가 Observable가 변화하면 Observer 호출 => Observer는 Observable을 구독(Subscribe라는 메서드로)
 
 Subscribe: onNext, onError, onCompleted라는 파라미터가 있고(onDisposed는 설명 생략) 모두 타입이 클로저 타입
 onNext: Observable이 항목(item)을 방출 했을 때 어떤 작업을 할 것인지,  새로운 항목(item)을 방출할 때마다 이 클로저가 호출
 onError: 해당 Observable이 오류가 발생 했을 때는 어떤 작업을 할 것인지
 onCompleted: 더 이상 이벤트가 발생하지 않고 종료됐을 때는 어떤 작업을 할 것인지
 
 Observable은 해당 이벤트가 발생했다는 것을 알려주기 위해 item이란 것을 emit(방출)한다. 그럼, 여러번 이벤트가 발생하면? -> 시퀀스를 생성할 수 있음 === 순서대로 방출
 */

class DocViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    var disposedBag: DisposeBag = .init()
    // just: 단 1번 값을 방출하고 메모리에서 내려감
    let justObservable = Observable.just(1) // just: 단 1번 값 1을 방출하고 사라짐(메모리에서 내려감 dispose)
    let justObservable2 = Observable<Int>.just(2) // just: 단 1번 값 2를 방출하고 사라짐(메모리에서 내려감 dispose)
    let justObservable3 = Observable<Array<Int>>.just([1,2]) // just: 단 1번 값 [1,2] 배열을 방출하고 사라짐(메모리에서 내려감 dispose)
    // of: 1개 이상의 항목(item)을 방출하는 Observable Sequence를 생성합니다
    let ofObservable = Observable.of(1,2)
    let ofObservable2 = Observable.of([1,2]) // 이거 역시 [1,2]라는 값을 반한다, 배열 자체를 한 개의 데이터로 보는것 사실 이게 맞지
    
    // from: 오직 하나의 배열만 받으며, 요소들을 순서대로 방출
    let fromObservable = Observable.from([1,2,3,4])
    
    // 근데 위의 것들은 다 동기잖아. 만약 비동기 이벤트에 대해서 observerble을 만들고 싶으면? => create
    /* create
     파라미터로 Observer를 매개변수로 받는 클로저를 전달받는 Observable Sequence를 생성합니다
     매개변수로 받은 Observer의 onNext, onCompleted, onError 메서드를 직접 호출할 수 있습니다
     클로저가 끝나기 전에 반드시 onCompleted이나 onError를 정확히 1번 호출해야 하며,
     그 이후로는 Observer의 다른 어떤 메서드도 호출해선 안됩니다
     */
    let createObservable = Observable<String>.create { observer in
        observer.onNext("첫 번째 방출")
        observer.onNext("두 번째 방출")
        observer.onCompleted()
        observer.onNext("세 번째 방출")
        return Disposables.create()
    }
    
    // empty: 어떠한 항목 방출없이 바로 정상적으로 스트림 종료
    let emptyObeserverble = Observable<Void>.empty()
    
    // never: 어떠한 항목도 방출하지 않고 스트림이 종료되지도 않음
    let neverObserverble = Observable<Void>.never()
    
    // range: 해당 범위 안의 정수를 모두 발행한 후 스트림이 종료
    let rangeObserverble = Observable.range(start: 0, count: 5)
    
    // interval: 주어진 시간 간격으로 순서대로 정수를 발행, 구독을 해제하기 전까지 이벤트를 무한 방출 => 불필요해졌을 경우 dispose 필
    let intervalObservable = Observable<Int>.interval(.seconds(1),scheduler: MainScheduler.instance)
    
    // timer: 구독 시점부터 특정 시간동안 이벤트 방출을 지연시킨 뒤, 지연된 후 이벤트를 방출하고나서 종료
    let timerObservable = Observable<Int>.timer(.seconds(3),scheduler: MainScheduler.instance)
    // ++ period: timer의 파라미터 => 다음 값이 생성되기까지의 주기를 지정 => 1초 뒤에 이벤트를 방출 - 2초 쉬고 - 이벤트 방출 - 2초 쉬고 - 이벤트 방출 무한 반복 => 불필요해졌을 경우 dispose 필
    let timerObservable2 = Observable<Int>.timer(.seconds(1),period: .seconds(2),scheduler: MainScheduler.instance)
    
    // defer: 옵저버가 구독할 때까지 옵저버블의 생성을 지연 => 이거 약간 lazy 같네 => Subscribe() 메서드를 호출 할 때 Observable을 생성합니다
    

    /*
     ❄️ Cold Observable ❄️
     구독이 되어야만 비로소 항목(이벤트)을 방출하는 Observable
     어느 시점에 구독하든 같은 결과를 받습니다
     
     🔥 Hot Observable 🔥
     구독 여부와 상관 없이 항목(이벤트)을 방출하는 Observable
     구독하는 시점에 따라 방출되는 결과가 다릅니다
     처음부터 방출되는 결과를 받지 못할 수 있습니다
     내가 구독한 시점부터 방출되는 이벤트만 받을 수 있고, 내가 구독하기 전에 이미 방출되어버린 이벤트는 받을 수 없음
     Subject 등
     ! subject는 multicast
     */
    let subject = PublishSubject<Int>()
    
    // Observable(unicast) vs Subject(multicast)
    // Observable(unicast): 나를 구독한 Observer가 몇 개든 간에, "독자적인 실행"
    let observable = Observable<Int>.deferred {
        return Observable.just(Int.random(in: 0..<100))
    }
    
    // Subject(multicast): 하나의 Observable의 실행이 여러 Subscribe에게 공유
     

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 밑의 두개는 서로 같은 값을 반환 => subject가 multicast
        subject.subscribe(onNext: {
            print("첫번째 Observer가 받는 항목 : \($0)")
        }).disposed(by: disposedBag)
         
        subject.subscribe(onNext: {
            print("두번째 Observer가 받는 항목 : \($0)")
        }).disposed(by: disposedBag)

        subject.onNext(Int.random(in: 0..<100))

        
        
        // 밑의 두개는 서로 다른 값을 반환 => Observable이 unicast 즉, 독자적으로 실행하기 때문에
//        observable.subscribe { num in
//            print(num)
//        }.disposed(by: disposedBag)
//
//        observable.subscribe { num in
//            print(num)
//        }.disposed(by: disposedBag)
        
        
        
        
//        subject.subscribe(onNext: {
//            print("첫번째 Observer가 받는 항목 : \($0)")
//        }).disposed(by: disposedBag)
//
//        subject.onNext("1")
//        subject.onNext("2")
//
//        subject.subscribe(onNext: {
//            print("두번째 Observer가 받는 항목 : \($0)")
//        }).disposed(by: disposedBag)
//
//        subject.onNext("3")
//
        
        
        // 비동기 이벤트에 대해 관찰 가능한 형태로 만든 후에 구독해서 이벤트까지
        myButton.rx.tap.subscribe {
            print("Observable이 아이템을 방출")
        } onError: { error in
            print(error)
        } onCompleted: {
            print("이벤트 끝났다.")
        }.disposed(by: disposedBag)
        
        //        emptyObeserverble.subscribe { data in
        //            print(data)
        //        }.dispose()
        
        
        //        let what = justObservable.subscribe { data in
        //            print("data is : ", data)
        //        } onError: { error in
        //            print("error : ", error)
        //        } onCompleted: {
        //            print("끝났다")
        //        } onDisposed: {
        //            print("메모리에서 내려간다")
        //        }
        //
        
        //        let what = ofObservable.subscribe { data in
        //            print("data is : ", data) // ofObservable의 값이 2개라서 2번 호출 됨, 그리고 바로 onCompleted, onDisposed 호출
        //        } onError: { error in
        //            print("error : ", error)
        //        } onCompleted: {
        //            print("끝났다")
        //        } onDisposed: {
        //            print("메모리에서 내려간다")
        //        }
                                        
    }
    
    
    
    
    
    
}

