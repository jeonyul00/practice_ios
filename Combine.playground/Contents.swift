import UIKit
import Combine


// 퍼블리셔 생성
var myIntArrPublisher: Publishers.Sequence<[Int], Never> = [1,2,3].publisher

// 구독
myIntArrPublisher.sink { completion in
    switch completion {
    case .finished:
        print("완")
    case .failure(let error):
        print("e : ", error)
    }
} receiveValue: { value in
    print("받은 값 : ", value)
}



