import UIKit

// 순환 참조

class UserInfo {
    var name = ""
    weak var grade:Grade?
    
    deinit {
        print("deinit userInfo")
    }
}


class Grade {
    var year = 0
    weak var userInfo:UserInfo?
    
    deinit {
        print("deinit Grade")
    }
}


var userInfo:UserInfo? = UserInfo() // 유저인포 레퍼런스 카운트 +1
var grade:Grade? = Grade() // 그레이드 레퍼런스 카운트 +1

// 순환 참조
userInfo?.grade = grade // 그레이드 레퍼런스 카운트 +1
grade?.userInfo = userInfo // 유저인포 레퍼런스 카운트 +1




userInfo = nil // 유저인포 레퍼런스 카운트 -1
grade = nil // 그레이드 레퍼런스 카운트 -1
// 결론: 해제 안됨

// 변수 내에서 참조하고 있는 애들도 다 지워야함, 여기서 말고 위에서 줘야하지
// userInfo?.grade = nil
// grade?.userInfo = nil

// 또는 약한 참조하면 됨, 둘
