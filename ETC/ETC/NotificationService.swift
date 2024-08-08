//
//  NotificationService.swift
//  ETC
//
//  Created by 전율 on 8/8/24.
//

import Foundation
import UserNotifications


class NotificationService {
    func sendNotification() {
        // 알림 권한 요청
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                // 알림 내용 설정
                let content = UNMutableNotificationContent()
                content.title = "제목입니다."
                content.body = "내용입니다."
                content.sound = UNNotificationSound.default
                
                // 알림 트리거 설정 (0.1초 후 알림 발생)
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // 알림 추가
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner , .sound])
    }
}
