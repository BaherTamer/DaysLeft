//
//  NotificationsView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 22/01/2023.
//

import SwiftUI

struct NotificationsView: View {

    @EnvironmentObject var localNotificationManager: LocalNotificationManager

    var body: some View {
        Form {
            Section {
                HStack {
                    Button("Open System Settings") {
                        localNotificationManager.openSettings()
                    }
                    .tint(.blue)

                    Spacer()
                    ExternalLinkIcon()
                }
            } footer: {
                Text("Please allow notifications from system settings.")
                    .padding(.vertical)
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            try? await localNotificationManager.requestAuthorization()
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NotificationsView()
                .environmentObject(LocalNotificationManager())
        }
    }
}
