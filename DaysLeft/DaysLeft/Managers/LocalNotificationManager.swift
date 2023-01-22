//
//  LocalNotificationManager.swift
//  DaysLeft
//
//  Created by Baher Tamer on 22/01/2023.
//

import NotificationCenter
import SwiftUI

struct LocalNotification {
    var id: String
    var title: String
    var date: DateComponents
}

@MainActor
final class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()

    override init() {
        super.init()
        notificationCenter.delegate = self
    }

    // Delegate Function For Foreground Notifications
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        [.sound, .banner]
    }

    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [.sound, .alert])
    }

    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }

    func schedule(localNotification: LocalNotification) async {
        let content = UNMutableNotificationContent()
        content.title = localNotification.title
        content.sound = .default

        let trigger = UNCalendarNotificationTrigger(dateMatching: localNotification.date, repeats: false)
        let request = UNNotificationRequest(identifier: localNotification.id, content: content, trigger: trigger)

        try? await notificationCenter.add(request)
        print(request)
    }

}
