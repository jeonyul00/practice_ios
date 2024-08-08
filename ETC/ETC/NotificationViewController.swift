import UIKit
import UserNotifications

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 알림 버튼 생성
        let notificationButton = UIButton(type: .system)
        notificationButton.setTitle("알림 보내기", for: .normal)
        notificationButton.addTarget(self, action: #selector(scheduleNotification), for: .touchUpInside)
        notificationButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        self.view.addSubview(notificationButton)
    }
    
    @objc func scheduleNotification() {
        
        // 백그라운드 작업 시작
        var backgroundTaskID: UIBackgroundTaskIdentifier?
        backgroundTaskID = UIApplication.shared.beginBackgroundTask() // 앱이 백그라운드로 전환 되었을 때 작업 수행
        
        // 알림 보내기
        NotificationService().sendNotification()
        
        // 백그라운드 작업 종료
        if let task = backgroundTaskID {
            UIApplication.shared.endBackgroundTask(task)
            backgroundTaskID = .invalid
        }
    }
}

