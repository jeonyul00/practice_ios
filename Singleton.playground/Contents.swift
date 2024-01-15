import UIKit

// 싱글톤 패턴: 자바 할 때 그렇게 연습했는데 모르면 개발자 그만해라 전율. => 그 때 키워드 뭐였지? => private, static, init => 여기서도 같은 개념이다.
// 인스턴스 1개만 만들어서 전역적으로 엑세스

class MyInfo {
    
    // static var shared: MyInfo()
    
    // 얘만 호출해서 쓸 수 있도록, shared라는 이름으로 쓰는게 관례란다.
    static var shared: MyInfo  = {
        // 만들어지고나서 추가 작업
        let info = MyInfo()
        info.name = "추가 작업"
        return info

    }() // 멀티 쓰레드 환경에서 단 하나의 인스턴스만 생성되도록 제공 해준다. 오 이거 좋네
    
    // 생성자를 private로 해서 호출할 수 없도록
    private init(name: String = "", age: Int = 0, id: String = "") {
        self.name = name
        self.age = age
        self.id = id
    }
    
    var name = ""
    var age = 0
    var id = ""
}

// static이니까 초기화 안해야 되지
// js의 리덕스처럼 쓸 수 있겠다.
MyInfo.shared.age
MyInfo.shared.age = 1
MyInfo.shared.age
MyInfo.shared.name

UserDefaults.standard.setValue("값", forKey: "키") // 스토리지에 저장
// appDelegate도 싱글톤이네
