import UIKit

// 순환참조

class UserInfo {
    var name = ""
    var grade: Grade?
    weak var grade2: Grade?
    
    
    deinit {
        print("유저 인포 메모리 해제")
    }
}


class Grade {
    var year = 0
    var userInfo: UserInfo?
    weak var userInfo2: UserInfo?
    
    deinit {
        print("학년 메모리 해제")
    }
}

var userInfo:UserInfo? = UserInfo() // userInfo count +1
var grade:Grade? = Grade() // grade count +1

userInfo?.grade = grade // grade count +1
grade?.userInfo = userInfo // userInfo count +1

// x: 메모리 해제 안됨 => 서로가 참조하고 있기 때문에, 이것이 순환 참조 => 해당되는 class에 nil 주기 전에 내부의 참조된 변수에도 nil을 줘보면 해제는 됨
//userInfo = nil // userInfo -1
//grade = nil // grade count -1

userInfo?.grade = nil // grade -1
grade?.userInfo = nil // userInfo -1
userInfo = nil // userInfo -1
grade = nil // grade count -1

// 아니면 약한 참조 또는 미소유 참조 주면 됨
var userInfo2:UserInfo? = UserInfo() // userInfo count +1
var grade2:Grade? = Grade() // grade count +1
userInfo2?.grade2 = grade2 // grade count +0
grade2?.userInfo2 = userInfo2 // grade count +0
userInfo2 = nil // -1
grade2 = nil // -1c
