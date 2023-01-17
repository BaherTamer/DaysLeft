//
//  DaysLeftApp.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import SwiftUI

@main
struct DaysLeftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
