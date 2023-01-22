//
//  DaysLeftApp.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import SwiftUI

@main
struct DaysLeftApp: App {

    @StateObject private var preferencesModel = PreferencesModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(preferencesModel)
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
                .onAppear {
                    preferencesModel.applyColorScheme()
                }
        }
    }
}
