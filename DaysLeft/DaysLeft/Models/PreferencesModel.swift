//
//  PreferencesModel.swift
//  DaysLeft
//
//  Created by Baher Tamer on 22/01/2023.
//

import SwiftUI

struct AppStorageKey {
    static let appColorScheme = "appColorScheme"
}

@MainActor
final class PreferencesModel: ObservableObject {
    // MARK: Light/Dark Mode Settings
    @AppStorage(String(AppStorageKey.appColorScheme)) var appColorScheme: ColorSchemeType = .unspecified {
        didSet {
            applyColorScheme()
        }
    }

    func applyColorScheme() {
        keyWindow?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: appColorScheme.rawValue)!
    }

    var keyWindow: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
            return nil
        }
        return window
    }
}
